#!/bin/bash

. ./var.sh

# get keys，循环扩区镜像的key值
for name_tag in ${!docker_save_images[@]};
do
    image_name=${docker_save_images[${name_tag}]} # get value
    echo "${image_name}"
    echo `docker pull $image_name`

    # replace image tag
    echo `docker image tag $image_name $name_tag`

    # save name tag image，替换：为-，因为貌似tar中不能有：load会有问题。
    save_name=${name_tag//:/-}
    save_name_tar=${save_name}'.tar'
    echo "${save_name_tar}"
    echo `docker save -o ../images/$save_name_tar $name_tag`

    # rmi image
    echo `docker rmi $image_name`
    echo `docker rmi $name_tag`
done

# scp push images to sever
