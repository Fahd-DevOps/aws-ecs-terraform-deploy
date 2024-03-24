## Automating Infrastructure with ECS, Docker, Terraform & New Relic Monitoring via GitHub Actions

## Overview about the setup

This project utilizes GitHub Actions to streamline the deployment process. It automates the creation of an ECS cluster with Docker containers. Terraform handles infrastructure provisioning, while New Relic monitors application health.

Sets Up State Storage:

     ``` create_statelock.sh ```
     This initializes secure state storage for Terraform using an S3 bucket and DynamoDB table.
    


Prepares Terraform for use:

    terraform init

Builds infrastructure:

    terraform apply

Streamlined CI/CD for Node.js on ECS:

    main.yml :
    - Builds and tests on Ubuntu with Node.js 16.
    - Updates the ECS service in test-ecs-cluster with a new Docker image.
    - also requires pre-configured ECS and Docker Hub secrets.
    

Simple Node.js Dockerfile:

    This Dockerfile creates a Node.js application image, copying code, installing dependencies, exposing port 3000, and running index.js with Node.

Simple Node.js Application:

    This Node.js script creates a simple HTTP server listening on port 3000 (configurable) and responds with "Hello Node from ecs with alb and monitor with new relic".


## Prerequisites

Before you begin, ensure you have the following:

- AWS CLI
- Terraform
- Docker
- Git
- nodejs

## Project Structure
  ```sh
     Task_Nawy/ 
    ├── Github_Action/
    │   ├── main.yml
    │        ├── infra
    │              ├── create_statelock.sh
    │              ├── main.tf
    │              ├── backend.tf
    │              ├── network.tf
    │              ├── alb.tf
    │              ├── app_url.txt
    │              ├── variables.tf
    │              ├── route_table.tf
    │              ├── route_table_association.tf
    │              ├── security_group.tf
    │              ├── internet_getway.tf
    │              ├── ecs_service.tf
    ├── app
    │   ├── Dockerfile
    │   ├── index.js
    ├── README.md
  ```

## Cleanup
   ```sh
   terraform destroy
   ```
$${\color{lightblue}Eng \space \color{lightgray}Fahd \space \color{lightgray}Khaled}$$