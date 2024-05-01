## Automated Three-Tier Architecture on AWS

This Terraform project automates the deployment of a highly available, secure three-tier architecture on AWS.

**Key Features:**

- **Multi-AZ VPC:** Public and private subnets across Availability Zones for redundancy.
- **Scalable Web Tier:** Elastic Load Balancer distributes traffic across web servers in the public subnet and application servers in the private subnet.
- **Secure Application Tier:** Application servers in a private subnet process business logic, isolated from the internet.
- **Managed Database:** RDS instance in a private subnet securely stores application data.
- **Robust Networking:** Route tables and security groups enforce communication policies and network security best practices.

## Architecture Diagram

This is an overview of the architecture this deployment will build.
![alt text](<1 DvuvxEPeuCgjefJugj4Idg.jpg>)

## Authors

- [@iahsanGill](https://www.github.com/iahsanGill)

## Linking terraform with your aws account

Make sure you have installed aws-cli and associated your aws account with it using access keys.
Visit this [link](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) for more information.

## Installation

Clone the repository and go into `stage` directory

```bash
  git clone <project-url>
  cd stage
```

Make sure you have terraform installed in your system.

Initialize the terraform in your working directory, it will install the modules and the required provider.

```bash
  terraform init
```

Apply the configurations to create your resources in your aws accout.

```bash
  terraform apply -var="db_username=your-db-username" -var="db_password=your-db-password"
```
