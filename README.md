# Containerized AWS Lambda Deployments with Terraform

Terraform version: 1.1.6

## Getting started

1. Copy and populate `env.sh`

    ```
    cp env.sh.template env.sh
    nano env.sh

    cp aws_lambda_functions/profile_faker/env.sh.template aws_lambda_functions/profile_faker/env.sh
    nano env.sh
    ```

2. Source `env.sh`

    ```
    source env.sh
    source aws_lambda_functions/profile_faker/env.sh
    ```

3. Build and push docker image

   ```
   cd aws_lambda_functions/profile_faker
   make docker/push TAG=dev
   cd -
   ```

4. Run terraform

   ```
   terraform init
   terraform plan
   terraform apply
   ```
