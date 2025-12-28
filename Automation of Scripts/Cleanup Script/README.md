******************** File Cleanup, Archival & Deletion Automation ********************

This automation script performs **controlled archival and deletion of files** based on their age.  
It is designed to reduce disk usage while preserving older data through structured archival.
The script supports **multiple operation modes** and generates logs for audit and traceability.

**Problem Statement:**  
Over time, systems accumulate unused and outdated files, leading to increased disk usage and maintenance overhead.  
Manual cleanup is error-prone and risky in production environments.

**Solution and Outcomes:**  
A Bash script that:  
- Archives files older than a defined threshold  
- Reduced active directory size from **12 KB to 0 KB** through automated archival  
- Archived **100% of files older than 400 days**  
- Automatically deleted archived files beyond **30-day retention**  
- Replaced manual cleanup with a fully automated, logged process  

**Operation Modes:**    
0: Archive files older than **400 days**  
1: Delete archived files older than **30 days**   
Invalid or missing mode results in script termination for safety.  

**Steps for Implementation:**    
1. Clone the Repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd 'Automation of Scripts/cleanup-script.sh'** 
2. Ensure AWS CLI is configured and required permissions are available: **aws configure**
3. Provide execute permission to the script: **chmod +x cleanup-script.sh**  
4. Open the script: **vi cleanup-script.sh**  
5. Update the file and folder paths as needed  
6. Save and close the script: **ESC+:wq**  
7. Run the script manually: **./cleanup-script.sh**
8. Schedule the script for automation once in a month at 11:30 using crontab:  
**crontab -e  
30 11 1 * * /path/cleanup-script.sh**
