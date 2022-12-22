# Containerized AWS Lambda Deployments with Terraform

Terraform version: 1.1.6

## Getting started

1. Copy and populate `env.sh`

    ```
    cp env.sh.template env.sh
    nano env.sh
    ```

2. Source `env.sh`

    ```
    source env.sh
    ```

3. Run terraform

   ```
   terraform plan -var="env_name=dev"
   terraform apply -var="env_name=dev"
   ```
