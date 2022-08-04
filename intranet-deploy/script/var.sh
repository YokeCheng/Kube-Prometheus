#!/bin/bash

# define dict name 'docker_images'
# 重点是下边的字典用法，key作为要修改后的docker名称和tag名称， value记录docker仓库中的镜像名称。
declare -A docker_save_images
docker_save_images=(
['alertmanager:v0.24.0']='quay.io/prometheus/alertmanager:v0.24.0' \
['blackbox-exporter:v0.21.0']='quay.io/prometheus/blackbox-exporter:v0.21.0' \
['configmap-reload:v0.5.0']='jimmidyson/configmap-reload:v0.5.0' \
['grafana:8.5.5']='grafana/grafana:8.5.5' \
['kube-rbac-proxy:v0.12.0']='quay.io/brancz/kube-rbac-proxy:v0.12.0' \
['kube-state-metrics:v2.5.0']='dyrnq/kube-state-metrics:v2.5.0' \
['node-exporter:v1.3.1']='quay.io/prometheus/node-exporter:v1.3.1' \
['prometheus:v2.36.1']='quay.io/prometheus/prometheus:v2.36.1' \
['prometheus-adapter:v0.9.1']='willdockerhub/prometheus-adapter:v0.9.1' \
['prometheus-operator:v0.57.0']='quay.io/prometheus-operator/prometheus-operator:v0.57.0' \
['prometheus-config-reloader:v0.57.0']='quay.io/prometheus-operator/prometheus-config-reloader:v0.57.0' \
          )

declare -A docker_load_images
docker_load_images=(
['alertmanager:v0.24.0']='prometheus/alertmanager:v0.24.0' \
['blackbox-exporter:v0.21.0']='prometheus/blackbox-exporter:v0.21.0' \
['configmap-reload:v0.5.0']='jimmidyson/configmap-reload:v0.5.0' \
['grafana:8.5.5']='grafana/grafana:8.5.5' \
['kube-rbac-proxy:v0.12.0']='brancz/kube-rbac-proxy:v0.12.0' \
['kube-state-metrics:v2.5.0']='dyrnq/kube-state-metrics:v2.5.0' \
['node-exporter:v1.3.1']='prometheus/node-exporter:v1.3.1' \
['prometheus:v2.36.1']='prometheus/prometheus:v2.36.1' \
['prometheus-adapter:v0.9.1']='willdockerhub/prometheus-adapter:v0.9.1' \
['prometheus-operator:v0.57.0']='prometheus-operator/prometheus-operator:v0.57.0' \
['prometheus-config-reloader:v0.57.0']='prometheus-operator/prometheus-config-reloader:v0.57.0' \
                )

docker_registry='10.18.1.102:9088'
























