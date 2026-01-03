******************** **AWS EC2 Provisioning using Terraform (Local State)** ********************  

This project demonstrates infrastructure provisioning on AWS using Terraform with a **local backend (terraform.tfstate)**, focusing on hands-on understanding of core Terraform workflow.  

**Terraform Workflow:**  
1. terraform init
2. terraform plan
3. terraform apply
4. terraform destroy  

**Outcomes:**  
**1. 1 EC2 instance created successfully  
2. 0 manual AWS Console steps  
3. Fully reproducible infrastructure using code  
4. State managed locally via terraform.tfstate**  

**Steps for Implementation:**  
1. Clone the Repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd 'Terraform/local_state'**  
2. Do the required changes in the configuration files  
3. Initialize Terraform: **terraform init**  
4. Preview infrastructure changes: **terraform plan**  
5. Create EC2 instance: **terraform apply**  
6. Clean up resources: **terraform destroy**  
