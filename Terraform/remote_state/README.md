******************** **Terraform AWS Infrastructure with Remote State (S3 + DynamoDB)** ********************  

This project demonstrates Terraform remote state management by separating infrastructure into two layers:  
**1. Backend infrastructure for state storage and locking
2. Application infrastructure that consumes the remote backend**   

**Outcomes:**    
**1. 100% remote state management  
2. State locking enabled (prevents concurrent applies)  
3. 2-layer Terraform design (backend + app)**  

**Steps for Implementation:**  
1. Clone the Repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd 'Terraform'**
2. Do the required changes in the configuration files
3. Provision backend infrastructure:  
**cd backend_infra  
terraform init  
terraform apply**
4. Provision application infrastructure:  
**cd ../app_infra  
terraform init  
terraform plan  
terraform apply**  
