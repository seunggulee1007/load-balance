#!/bin/sh

./gradlew clean

docker stop server1 || true

docker rm server1 || true

docker rmi server1:latest || true

./gradlew bootBuildImage --imageName=server1:latest

docker run --network load-balance-network --name server1 -d -p 9001:8080 server1:latest