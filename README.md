# Enterprise AWS Infrastructure Platform

> End-to-end Infrastructure as Code (IaC) project built with Terraform to provision a production-style AWS environment and deploy a Java application using Elastic Beanstalk.

---

# Project Overview

This project automates the provisioning of a complete AWS infrastructure using Terraform. It demonstrates enterprise-level cloud architecture, networking, security, application deployment, and managed AWS services.

The infrastructure hosts a Java-based web application built with Maven and deployed through AWS Elastic Beanstalk.

---

# Architecture

```
                                    Internet
                                        │
                                        ▼
                         Application Load Balancer
                                        │
                                        ▼
                           Elastic Beanstalk Environment
                                        │
               ┌───────────────┬───────────────┬───────────────┐
               │               │               │
               ▼               ▼               ▼
             Amazon RDS     Memcached      RabbitMQ
               │
               ▼
        Private Subnets
               ▲
               │
          NAT Gateway
               ▲
               │
        Public Subnets
               │
        Bastion Host (SSH)
               │
          Internet Gateway
               │
               ▼
               VPC
```

---

# AWS Services Used

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Bastion Host
- IAM Roles
- IAM Instance Profile
- Elastic Beanstalk
- Application Load Balancer (ALB)
- Auto Scaling
- Amazon RDS (MySQL)
- Amazon ElastiCache (Memcached)
- Amazon MQ (RabbitMQ)
- EC2
- Key Pairs

---

# Technologies

- Terraform
- AWS
- Infrastructure as Code (IaC)
- Java
- Maven
- Git
- GitHub

---

# Project Structure

```
.
├── backend.tf
├── backend-services.tf
├── bastion-host.tf
├── bean-app.tf
├── bean-env.tf
├── keypairs.tf
├── outputs.tf
├── providers.tf
├── secgrp.tf
├── variables.tf
├── vpc.tf
├── templates/
└── vprofile-project/
    ├── src/
    ├── pom.xml
    └── ...
```

---

# Infrastructure Components

## Networking

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

## Security

- IAM Roles
- Security Groups
- Bastion Host
- SSH Key Pair

## Compute

- Elastic Beanstalk
- Auto Scaling
- EC2 Instances

## Database

- Amazon RDS

## Cache

- Amazon ElastiCache (Memcached)

## Messaging

- Amazon MQ (RabbitMQ)

## Load Balancing

- Application Load Balancer (ALB)

---

# Application

- Java Web Application
- Maven Build
- Elastic Beanstalk Deployment

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Review execution plan

```bash
terraform plan
```

Provision infrastructure

```bash
terraform apply
```

Destroy infrastructure

```bash
terraform destroy
```

---

# Features

- Infrastructure as Code
- Automated AWS provisioning
- Multi-tier architecture
- Public & Private networking
- Secure Bastion Host access
- Auto Scaling
- Application Load Balancing
- Managed Database
- Managed Cache
- Managed Message Broker
- Java application deployment

---

# Learning Outcomes

This project demonstrates practical experience with:

- Terraform
- AWS Networking
- Infrastructure as Code
- Elastic Beanstalk
- Auto Scaling
- IAM
- VPC Design
- Security Groups
- NAT Gateway
- RDS
- ElastiCache
- RabbitMQ
- Maven
- Java Deployment

---

# Future Enhancements

- Remote Terraform State (S3 + DynamoDB Locking)
- Terraform Modules
- CI/CD using Jenkins
- GitHub Actions
- Docker
- Kubernetes (EKS)
- CloudWatch Monitoring
- Route53
- ACM SSL Certificates

---

# Author

**Vivek Vennam**

DevOps | AWS | Terraform | Java | Infrastructure as Code
