FROM amd64/python:3.9-slim

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Python 라이브러리 설치
RUN pip install -U pip &&\
    pip install psycopg2-binary boto3  mlflow python-dotenv scikit-learn pandas 

# MinIO 클라이언트 설치
RUN cd /tmp && \
    wget https://dl.min.io/client/mc/release/linux-amd64/mc && \
    chmod +x mc && \
    mv mc /usr/bin/mc

COPY . /usr/model

WORKDIR /usr/model 

# Entrypoint 설정
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Entrypoint 스크립트 실행
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]