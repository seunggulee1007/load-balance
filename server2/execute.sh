.PHONY: run

run:
	@echo "Running ./gradlew docker"
	@./gradlew clean
    @./gradlew bootBuildImage --imageName=server2:latest
    @docker run --network load-balance-network -p 9002:8080 server2:latest