# aws_lambda_with_terraform
## terraform 으로 생성된 Lambda function과 CI/CD tool로 관리되는 코드와 상호 충돌없이 관리할 수 있는 방법입니다.
### 1. Lambda function 은 terraform으로 생성합니다.
###   생성후 dev alias 를 생성하고 $LATEST 를 포인팅합니다.
### 2. function code는 Github Action으로 push 시 배포합니다.
###   배포가 성공하면 새로운 version 을 생성합니다.
###   prd alias의 존재를 먼저 확인하고 새로운 버전으로, alias를 생성/수정합니다.
### 3. 서비스에서는 prd alias를 사용합니다.
