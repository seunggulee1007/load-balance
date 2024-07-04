#!/bin/sh

./gradlew clean

docker stop server2 || true

docker rm server2 || true

docker rmi server2:latest || true

./gradlew bootBuildImage --imageName=server2:latest

docker run --network load-balance-network --name server2 -d -p 9002:8080 server2:latest