******************** AWS Resource Usage Report ********************

This script automates the collection of key **AWS resource usage details** and generates a **daily report** for visibility into the cloud environment.
It was created to understand and monitor active AWS resources from an **operational and production-readiness perspective**, and can be scheduled to run daily at **10:00 AM** using cron.

**Problem:**
Tracking AWS resources manually becomes inefficient and time-consuming as environments grow.  

**Solution:**
This script provides a simple, automated way to capture daily snapshots of commonly used AWS services.
A Bash script that uses **AWS CLI** and **jq** to fetch resource details and stores them in a dated log file for historical tracking and auditing.

**Resources Captured:**
- EC2 instance IDs
- S3 bucket list
- Lambda functions
- IAM users

**Steps for Implementation:**
1. Clone the Repository:  
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd 'Automation of Scripts/aws-resource-usage-report.sh'**
2. Ensure AWS CLI is configured and required permissions are available: **aws configure**
3. Provide execute permission to the script: **chmod +x aws-resource-usage.sh**
4. Open the script: **vi aws-resource-usage.sh**
5. Update the file and folder paths as needed
6. Save and close the script: **ESC+:wq**
7. Run the script manually: **./aws-resource-usage.sh**
8. Schedule the script for daily automation at **10:00** using crontab:  
**crontab -e  
0 10 * * * /path/aws-resource-usage.sh**


