# Containerized AWS Lambda Deployments with Terraform

Terraform version: 1.1.6

## Getting started

1. Copy, populate, and source `env.sh`

    ```
    cp env.sh.template env.sh
    nano env.sh
    source env.sh

    cp aws_lambda_functions/profile_faker/env.sh.template aws_lambda_functions/profile_faker/env.sh
    nano aws_lambda_functions/profile_faker/env.sh
    source aws_lambda_functions/profile_faker/env.sh
    ```

2. Build and push docker image

   ```
   cd aws_lambda_functions/profile_faker
   make docker/push TAG=dev
   cd -
   ```

3. Run terraform

   ```
   terraform init
   terraform plan
   terraform apply
   ```
