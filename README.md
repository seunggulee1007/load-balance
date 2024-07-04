# load-balance

해당 프로젝트는 `가상면접 사례로 배우는 대규모 시스템 설계 기초` 책에 나오는 내용을 분석한 뒤 실제로 구현해보는 프로젝트입니다.<br/>
그 중 첫번째 장인 `사용자 수에 따른 규모 확장성` 에 대한 내용을 다루고 있으며 `수직적 규모 확장 vs 수평적 규모 확장` 의 로드밸런서에 대한 내용을 구현했습니다.

## 1. 구성
- load-balance
  - server1
  - server2
  - server3
위와 같이 3대의 스프링 웹 서버와 1대의 로드밸런서로 구성되어 있습니다.<br/>

load-balance 는 3대의 서버에 대한 요청을 분산하여 처리하는 역할을 하고, nginx 를 이용하여 로드밸런싱을 구현했습니다.<br/>
Docker Network 를 통해 Docker Container 간의 통신을 할 수 있도록 구성했고, 각 컨테이너의 이름만으로 통신할 수 있도록 nginx 설정을 구성했습니다.<br/>

## 2. docker network 만들기

``` dockerfile
docker network create load-balance-network
```
도커 컨테이너의 이름만으로 통신할 수 있도록 네트워크를 구성해 줍니다.

## 3. server1, server2, server3 빌드 및 실행
각 서버들은 동일한 구성을 가지고 있으며, 각 프로젝트 안에 `execute.sh` 파일이 존재해서 해당 파일을 실행하면 도커로 빌드 및 실행이 됩니다.
해당 프로젝트들이 먼저 실행되어야 nginx 가 정상적으로 동작합니다.

## 4. nginx 빌드 및 실행
nginx 는 `nginx` 디렉토리 안에 `execute.sh` 파일을 실행하면 빌드 및 실행이 됩니다.

## 5. 실행결과
각 서버에서 /hello 를 호출하게 되면 Hello, i'm {serverName} 이 출력되는 것을 확인할 수 있습니다.<br/>
nginx 를 통해 로드밸런싱이 되어있기 때문에 서버에 대한 요청이 분산되어 처리되는 것을 확인할 수 있습니다. ( {serverName} 은 server1, server2, server3 중 하나가 무작위로 출력 됩니다.)