# 기본 이미지 설정
# FROM ubuntu:18.04
# GPU 지원을 위해 NVIDIA에서 제공하는 CUDA 이미지를 사용
FROM nvidia/cuda:11.4.1-base-ubuntu18.04


# 필요한 패키지 설치 및 OpenJDK 17 추가
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-17-jdk ca-certificates-java && \
    update-ca-certificates -f

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-11-0 \
        cuda-nvml-dev-11-0 \
        cuda-minimal-build-11-0 \
        cuda-command-line-tools-11-0 \
        libcublas-11-0 \
        libcublas-dev-11-0 \
        libcudnn8 \
        libcudnn8-dev \
    && \
    rm -rf /var/lib/apt/lists/*

# JAR 파일 복사
ARG JAR_FILE=build/libs/final-gpu-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

# 컨테이너 실행 명령
ENTRYPOINT [ "java", "-jar", "app.jar" ]
