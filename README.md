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

prod.cuest.io: Production environment.
stage.cuest.io: Staging environment.
dev.cuest.io: Development environment.

**DNS Records**
For each deployment environment, there's the following DNS records:

stage.cuest.io and www.stage.cuest.io: These records are aliased to the corresponding S3 bucket used for hosting the stage environment.

docs.stage.cuest.io and www.docs.stage.cuest.io: These records are aliased to the stage S3 bucket used for hosting documentation.

console.stage.cuest.io and www.console.stage.cuest.io: These records are aliased to the stage S3 bucket used for hosting the web-based UI application.

**S3 Buckets**
there's S3 buckets for each deployment environment to host static website content.

cuest-stage-bucket: Used to host the stage environment.
cuest-docs-stage-bucket: Used to host documentation for the stage environment.
cuest-console-stage-bucket: Used to host the web-based UI application for the stage environment.
Each S3 bucket is configured for static website hosting, with an index.html file as the default index document and an error.html file for error handling.

**ACM Certificate**
An ACM certificate is created to secure the custom domain names used for each deployment environment.

stage.cuest.io: SSL certificate for the stage environment.
docs.stage.cuest.io: SSL certificate for the stage documentation.
console.stage.cuest.io: SSL certificate for the stage web-based UI.
Cognito Setup
Cognito is used to manage user authentication for the CUEST project.it's configure Cognito user pools and clients for each deployment environment.

dev-cuest-user-pool: User pool for the development environment.
stage-cuest-user-pool: User pool for the staging environment.
prod-cuest-user-pool: User pool for the production environment.
Cognito identity pools are also configured to integrate with the user pools for authentication.

**Certificates and Approvals**
Please note that in addition to the resources mentioned above, the setup process includes the generation and approval of SSL certificates, AWS resource creation, and DNS record updates. These steps require administrative approvals and validation to ensure security and proper functioning of the infrastructure.

**Usage**

#### Managing Deployment Environments

This project uses Terraform Workspaces to manage different deployment environments, such as "dev," "stage," and "prod." Follow these steps to set up and manage your environments:

1. **Initialize Your Workspace:**

   Before you start, ensure you have Terraform installed and AWS credentials configured properly.

   - To create a new workspace for a specific environment, run:

     terraform workspace new stage
 
     Replace "stage" with the desired environment name.

   - To switch between workspaces, use:


     terraform workspace select stage


2. **Initialize Terraform:**

   After selecting the workspace, initialize Terraform in that environment using:

   terraform init -backend-config="dev-backend.hcl"

3. **Apply changes to the infrastructure for the selected environment:**

    terraform apply