#!/bin/zsh
docker stop load-balancer-nginx || true
docker rm load-balancer-nginx   || true
docker rmi load-balancer-nginx:latest || true

docker build -t load-balancer-nginx:latest .
docker run --network load-balance-network --name load-balancer-nginx -d -p 9000:80 load-balancer-nginx:latest