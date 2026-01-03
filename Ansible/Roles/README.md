******************** **File Archival & Cleanup Automation through Ansible Roles** ********************  

This role implements file archival and cleanup automation using **Ansible**, **migrating** an earlier **Shell-based solution** into an **idempotent**, **scalable** **Ansible role** for better maintainability and controlled execution.  

**Problem Statement:**  
1. Accumulation of unused files increased disk usage  
2. Manual cleanup was risky and error-prone in production  

**Solution:**    
Implemented an Ansible role that:  
1. Validates directories before execution (**100% safety check**)  
2. **Archives** files **older than 400 days**  
3. **Deletes** archived files **older than 30 days**  
4. Supports **2 execution modes**: **archive and delete**  
5. Prevents changes during **check mode**  

**Outcomes:**  
**1. 100% of files > 400 days archived  
2. 100% of archived files > 30 days deleted  
3. Active directory size reduced from 12 KB → 0 KB  
4. 0 manual interventions after automation**  

**Steps for Implementation:**  
1. Clone the Repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd cleanup-role**  
2. Ensure that the **passwordless authentication** is enabled and **ansible** is installed: **ansible --version**
3. Run in check mode (safe dry run): **ansible-playbook -i inventory-file cleanup-playbook.yml --check**  
4. Execute archival: **ansible-playbook -i inventory-file cleanup-playbook.yml** (no need to specify mode, as its set to archival by default)  
5. Execute deletion: **ansible-playbook -i inventory-file cleanup-playbook.yml -e cleanup_mode=delete**
6. Navigate to the respective archival and deletion directories and check for the files  
