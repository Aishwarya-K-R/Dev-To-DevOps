******************** **Nginx Installation and Service Automation through Ansible Playbook** ********************

This demonstrates a simple playbook created to demonstrate hands-on automation of a web server setup using Ansible.  

**What this playbook does:**  
1. Installs **Nginx** using the **apt** module  
2. Starts the **Nginx service** using the service module  
3. Works across **multiple hosts** defined in inventory  

**Why this was implemented:**  
1. To move away from manual package installation via SSH  
2. To understand Ansible playbook structure  
3. To practice **idempotent** infrastructure automation  
4. To gain hands-on experience with real system-level automation  

**Outcome:**  
1. **Nginx installed and running** in a single automated run, across **multiple hosts**  
2. Safe to re-run multiple times without side effects  

**Steps for Implementation:**  
1. Clone the repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd Ansible/Playbook**  
2. Create required number of **EC2 instances** with one instance acting as **master(control node)** and remaining as **slaves(hosts)**  
3. Login to master EC2 instance and enable **passwordless authenticatio**n to all the target hosts  
4. Install Ansible:  
**sudo apt install ansible  
ansible --version**  
5. Update the inventory file(inventory-file) with target host details (private IPs)  
6. Run the Ansible playbook: **ansible-playbook -i inventory-file playbook-1.yml**  
7. Login to any of the target servers and verify the status of Nginx service: **systemctl status nginx**  
