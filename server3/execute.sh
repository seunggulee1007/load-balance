.PHONY: run

run:
	@echo "Running ./gradlew docker"
	@./gradlew clean
    @./gradlew bootBuildImage --imageName=server3:latest
    @docker run --network load-balance-network -p 9003:8080 server3:latest