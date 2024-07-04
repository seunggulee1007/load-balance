#!/bin/sh

./gradlew clean


docker stop server3 || true

docker rm server3 || true

docker rmi server3:latest || true

./gradlew bootBuildImage --imageName=server3:latest

docker run --network load-balance-network --name server3 -d -p 9003:8080 server3:latest