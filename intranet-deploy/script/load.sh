#!/bin/bash

. ./var.sh

for name_tag in ${!docker_load_images[@]};
do
    # save name tag image
    save_name=${name_tag//:/-}
    save_name_tar=${save_name}'.tar'
    echo "${save_name_tar}"
    # docker load tar
    echo `docker load -i ../images/$save_name_tar`

    # replace image tag
    image_name=${docker_load_images[${name_tag}]} # get value
    echo `docker image tag $name_tag $docker_registry/$image_name`

    # pull image tag
    echo `docker push $docker_registry/$image_name`

    # rmi local rmi
    echo `docker rmi $name_tag`
done

