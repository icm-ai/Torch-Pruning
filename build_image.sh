#!/bin/bash

# 设置默认值
IMAGE_NAME="torch-pruning:debug"
DOCKERFILE="Dockerfile.debug"

# 处理命令行参数
while getopts ":n:f:" opt; do
  case $opt in
    n) IMAGE_NAME="$OPTARG" ;;
    f) DOCKERFILE="$OPTARG" ;;
    \?) echo "无效选项: -$OPTARG" >&2; exit 1 ;;
    :) echo "选项 -$OPTARG 需要参数." >&2; exit 1 ;;
  esac
done

echo "构建镜像: $IMAGE_NAME 使用 $DOCKERFILE"
docker build -f "$DOCKERFILE" -t "$IMAGE_NAME" .

echo "构建完成！"
echo "运行容器: docker run -it --rm $IMAGE_NAME"
