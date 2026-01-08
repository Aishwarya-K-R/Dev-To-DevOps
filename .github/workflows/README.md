******************** **CI/CD Pipeline for React App Deployment to GitHub Pages** ********************

This demonstrates a **CI/CD pipeline** using **GitHub Actions** to build and deploy a **React application** to **GitHub Pages** with automated execution on every push to the main branch.

**Deployed Site: https://Aishwarya-K-R.github.io/Dev-To-DevOps/**

**CI/CD Workflow Steps:**  
1. Checkout source code  
2. Set up Node.js runtime  
3. Install dependencies  
4. Build React app  
5. Deploy to GitHub Pages  

Runner Configuration:  
1. **runs-on: ubuntu-latest**  
- Uses GitHub-hosted runners managed by GitHub  
2. **runs-on: self-hosted**  
- Uses a self-hosted runner (useful for custom environments)  

**Outcomes:**  
**1. 100% automated deployment on code push  
2. 0 manual build or deploy steps  
3. Consistent and repeatable releases**  

**Steps for Implementation:**  
1. Create a **React application** and push it to the **root** of the repository  
2. Enable the **GitHub Pages**:  
- Go to **Settings** -> **Pages**  
- Under **Build and Deployment**, select **Deploy from a branch**   
- Under **Branch**, select **gh-pages** and **/root** under the **Folder** -> **Save**  
3. Go to **package.json** in the **root** of the project and add **homepage** field referencing to the deployed site path: **"homepage": "https://OWNER.github.io/REPO"**    
4. Configure **GitHub Actions workflow** and push it to the **root** of the repository: **.github/workflows/deploy.yml**  
5. **Workflow** automatically runs on **push** and deployed site becomes accessible at: **"https://OWNER.github.io/REPO"**
