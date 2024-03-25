AWS Infrastructure Setup - README

This README provides an overview of the AWS infrastructure setup for the CUEST project, which includes the creation of various AWS resources using Terraform for different deployment environments.


**Prerequisites**

Before you begin, make sure you have the following:

AWS CLI: Install and configure the AWS CLI with your AWS credentials.
Terraform: If you are using Terraform, ensure that it is installed on your local machine.


**AWS Resources**
Route 53
Route 53 Hosted Zones
For each deployment environment (prod, stage, dev), there's Route 53 hosted zones to manage DNS records.

**DNS Records**
For each deployment environment, there's the following DNS records:

env.docs.cuest.io and www.docs.stage.cuest.io: These records are aliased to the stage S3 bucket used for hosting documentation.
env.console.cuest.io and www.console.stage.cuest.io: These records are aliased to the stage S3 bucket used for hosting the web-based UI application.

**S3 Buckets**
there's S3 buckets for each deployment environment to host static website content.
Each S3 bucket is configured for static website hosting, with an index.html file as the default index document and an error.html file for error handling.

**ACM Certificate**
An ACM certificate is created to secure the custom domain names used for each deployment environment.
For every certificate, we need to create records in Route 53 manually (In AWS console)

**Cognito Setup**
Cognito is used to manage user authentication for the CUEST project.
it's configure Cognito user pools and clients for each deployment environment.

dev-cuest-user-pool: User pool for the development environment.
stage-cuest-user-pool: User pool for the staging environment.
prod-cuest-user-pool: User pool for the production environment.
Cognito identity pools are also configured to integrate with the user pools for authentication. (Not Yet)

**Certificates and Approvals**
Please note that in addition to the resources mentioned above, the setup process includes the generation and approval of SSL certificates, AWS resource creation, and DNS record updates. These steps require administrative approvals and validation to ensure security and proper functioning of the infrastructure.

**Usage**

#### Managing Deployment Environments

This project uses Terraform Workspaces to manage different deployment environments, such as "dev," "stage," and "prod." Follow these steps to set up and manage your environments:

0. **Create S3 Bucket For Terraform State File (If Not Exists):**

  In AWS console search for S3 service,

  create S3 bucket based on the content inside dev-backend.hcl


1. **Initialize Terraform:**

   After selecting the workspace, initialize Terraform in that environment using:

   terraform init -backend-config="dev/dev-backend.hcl"


2. **Plan changes to the infrastructure for the selected environment:**

    terraform plan -var-file="dev/dev.tfvars"   


3. **Apply changes to the infrastructure for the selected environment:**

    terraform apply -var-file="dev/dev.tfvars"