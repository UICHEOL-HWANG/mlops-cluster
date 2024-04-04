#!/bin/sh


# 스크립트 내에서 환경 변수 사용

# 다른 명령어 실행
mc config host add mlflowminio http://mlflow-artifact-store:9000  minio miniostorage
mc mb --ignore-existing mlflowminio/mlflow
mlflow server \
--backend-store-uri postgresql://mlflowuser:mlflowpassword@mlflow-backend-store/mlflowdatabase \
--default-artifact-root s3://mlflow/ \
--host 0.0.0.0