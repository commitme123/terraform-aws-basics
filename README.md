# Terraform AWS Basics

This repository demonstrates core Infrastructure as Code (IaC) concepts using Terraform to provision a secure, basic AWS environment.

## Architecture
- **Amazon S3:** Creates a storage bucket for static assets.
- **Amazon EC2:** Deploys a free-tier Ubuntu 22.04 instance.
- **AWS Security Group:** Acts as a firewall, restricting SSH (port 22) access to a specific IP address (least privilege).
- **Outputs:** Exposes the public IP of the instance and the bucket name.

## Prerequisites
- [Terraform installed](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) with an IAM user that has programmatic access.

## Usage
1. Clone the repository:
   `git clone https://github.com/your-username/terraform-aws-basics.git`
2. Initialize Terraform:
   `terraform init`
3. Review the execution plan:
   `terraform plan`
4. Deploy the infrastructure:
   `terraform apply`
5. (Optional) Destroy the infrastructure to avoid AWS charges:
   `terraform destroy`

## Proof of Validation

To ensure the code is functional without incurring AWS charges, I validated the configuration using `terraform validate` and reviewed the execution plan using `terraform plan`. 

### 1. Configuration Validation
![Terraform Validate](images/validate.png)

### 2. Execution Plan: Security Group
*Restricting inbound SSH access to a specific IP.*
![Terraform Plan Security Group](images/plan-sg.png)

### 3. Execution Plan: S3 Bucket
*Provisioning the S3 bucket with environment tags.*
![Terraform Plan S3](images/plan-s3.png)

### 4. Execution Plan: EC2 Instance
*Deploying a t2.micro instance with the attached Security Group.*
![Terraform Plan EC2](images/plan-ec2.png)

## What I Learned
- How to structure Terraform files (`main.tf`, `variables.tf`, `outputs.tf`).
- The importance of `.gitignore` to protect state files (`tfstate`).
- How to use Terraform to enforce security best practices (restricting SSH CIDR blocks).
- How to read a Terraform execution plan to verify infrastructure changes before applying them.