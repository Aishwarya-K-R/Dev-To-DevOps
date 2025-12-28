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

