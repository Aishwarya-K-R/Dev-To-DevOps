********************* GitHub Repository Access Audit Automation ********************  
This script automates the auditing of read (pull) access to GitHub repositories using the **GitHub REST API**.
It eliminates manual repository inspection and provides fast, reliable, and repeatable access visibility using Bash scripting.

**Problems:**
- Manual checking of GitHub collaborators is time-consuming and error-prone
- Difficult to scale access audits across multiple repositories
- No standardized, logged approach for periodic access validation

**Solution:**  
Two Bash automation scripts powered by:
- **GitHub REST API**
- **curl** for API calls
- **jq** for response parsing

**1. Single Repository Access Audit:**  
- Fetches users with read (pull) access for a specific repository
- Accepts owner and repo name as CLI arguments

**2. Multi-Repository Access Audit:**  
- Audits multiple repositories in one execution
- Reads owner and repository details from an input file
- Ideal for org-wide or team-wide access reviews

**Outcomes & Measurable Impact:**  
**1. Single Repository Script:**
- **Execution time:** 19 seconds
- **Accuracy:** 100% (direct API-based permissions)
- **Manual effort reduced:** ~90%
- Replaced **~5–10 minutes** of manual checks with 1 command

**2. Multi-Repository Script:**
- **Execution time:** 29 seconds (batch mode)
- **Repositories audited:** Multiple in a single run
- **Manual effort reduced:** ~95%
- Enabled scalable and repeatable access audits

**Steps for Implementation:**      
1. Clone the Repository:    
**git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps  
cd 'Automation of Scripts/gtihub-api.sh'  
cd 'Automation of Scripts/gtihub-api-scalable.sh'**  
2. Ensure AWS CLI is configured and required permissions are available: **aws configure**  
3. Provide execute permission to the script:  
**chmod +x github-api.sh  
chmod +x github-api-scalable.sh**  
4. Open the script:  
**vi github-api.sh  
vi github-api-scalable.sh**  
5. Update the file and folder paths as needed  
6. Save and close the script: **ESC+:wq**  
7. Run the script manually by providing the correct arguments:   
**./github-api.sh owner-name repo-name   
./github-api-scalable.sh github-accounts.txt**  
