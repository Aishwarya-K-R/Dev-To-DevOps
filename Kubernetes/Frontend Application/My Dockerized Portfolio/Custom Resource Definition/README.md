******************** **Custom Frontend Deployment using CRD & Controller** ********************   
This project demonstrates deploying a frontend application on **Kubernetes** using a **Custom Resource Definition (CRD)** and a **custom controller**, providing a **higher-level abstraction** over standard Kubernetes resources.

**Overview:**   
Instead of manually creating **multiple Kubernetes manifests (Deployment, Service, Ingress)**, this setup introduces a **custom resource** called **AppDeployment**. A **custom controller watches** for this resource and **automatically provisions** all required Kubernetes components.

**Components:**   
1. **Custom Resource Definition (CRD)**:  
- The CRD defines a new Kubernetes resource type: **AppDeployment (platform.example.com/v1)**  
- It validates and stores application-specific fields such as **container image**, **replica count**, **application port** and **ingress hostname**.
2. **Custom Resource (AppDeployment)**: **Application-specific fields** are defined in the **yaml** file.
3. **Custom Controller:** A **Python-based Kubernetes controller** continuously **watches AppDeployment resources** and creates the following Kubernetes objects automatically:
- **Deployment:** Runs the frontend application pods
- **Service:** Exposes the pods internally
- **Ingress:** Routes external traffic to the service
  
**Request Flow:**

<img width="228" height="203" alt="image" src="https://github.com/user-attachments/assets/267a6ac0-70c7-4042-83cf-bcf02f73b8fc" />

**Steps for Implementation:**  
1. Clone the repository:  
   **git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps**    
   **cd 'Kubernetes/Frontend Application/My Dockerized Portfolio/K8s'**  
2. Start Docker: **colima start** (command varies based on OS and mode of installation)  
3. Start Minikube: **minikube start** (Docker Driver is the default driver. Drivers can be specified explicilty using --driver)  
4. Run the Custom Controller: **python3 custom-controller.py**  
5. Apply the CRD and CR:  
   **kubectl apply -f app-deployment-crd.yml  
   kubectl apply -f app.yml**
6. Verify Created Resources:  
   **kubectl get deployments  
   kubectl get services  
   kubectl get ingress  
   kubectl get pods**
7. Forwards traffic from local machine (port 8080) to the Kubernetes Ingress controller: **kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80**  
8. Enter domain name in the browser to access the application: **http://portfolio.local:8080/**  
