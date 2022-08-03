# kube-prometheus

[![Build Status](https://github.com/prometheus-operator/kube-prometheus/workflows/ci/badge.svg)](https://github.com/prometheus-operator/kube-prometheus/actions)
[![Slack](https://img.shields.io/badge/join%20slack-%23prometheus--operator-brightgreen.svg)](http://slack.k8s.io/)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/prometheus-operator/kube-prometheus)

> Note that everything is experimental and may change significantly at any time.

## 外网快速部署
> 注意：对于 Kubernetes v1.21.z 之前的版本，请参考【Kubernetes 兼容性矩阵】（兼容性），以便选择兼容的分支。
该项目旨在用作库（即，目的不是让您创建自己的此存储库的修改副本）。尽管为了快速入门，使用此库（特别是使用 `example.jsonnet`）生成的 Kubernetes [manifests](manifests) 的编译版本已签入此存储库，以便快速尝试内容。要尝试未自定义的堆栈运行：使用 `manifests` 目录中的配置创建监控堆栈
### 部署操作
```shell
# Create the namespace and CRDs, and then wait for them to be available before creating the remaining resources
kubectl apply --server-side -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl apply -f manifests/
```

我们首先创建命名空间和 CustomResourceDefinitions 以避免在部署监控组件时出现竞争条件。或者，可以使用单个命令“kubectl apply --server-side -f manifestssetup -f manifests”来应用两个文件夹中的资源，但可能需要多次运行该命令才能成功创建所有组件。

### 删除操作
```shell
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```

## 内网操作
内网文件位于intranet文件夹中，文件夹中还包括镜像文件等

### 解压镜像并推送到内网镜像仓库
```shell
# 进入目录
cd intranet/shell

# 更改变量，更改保存的镜像仓库地址
vi var.sh

# 执行导入镜像脚本
bash ./load.sh
```

### 部署操作
```shell
# 更改manifests中镜像的仓库地址，内部默认是10.18.1.102:9088
# 可采用全选替换的方式

# Create the namespace and CRDs, and then wait for them to be available before creating the remaining resources
kubectl apply --server-side -f manifests-intranet/setup
# 需等待几秒以后在执行，可能需要重新执行几次试试
kubectl apply -f manifests-intranet/
```

## 部署问题

### no matchs for kind "PodDisruptionBudget" in version "policy/v1"
![img.png](img.png)
#### 解析: 集群版本可能比较低，当前资源的version可能还属于v1beta版本，可以通过下列命令查看一下，然后修改对应文件
```shell
# 查看资源
kubectl api-resources

# 查看版本
kubectl api-versions
```

### Prometheus面板显示如下错误
```shell
Warning: Error fetching server time: Detected 481.9449999332428 seconds time difference between your prometheus
```

#### 解析: 服务器时区和当前浏览器系统时区不一致，导致查询时间有误差，需调整服务器时区。