******************** **Kubernetes Deployment of Frontend Portfolio Application** ********************

This foldre contains the **Kubernetes deployment configuration** for the **Frontend Application**, deployed on a **Minikube** Kubernetes cluster and exposed using **Ingress with TLS (self-signed certificate)**.  
Docker image used (Docker Hub): **aishwaryakr/portfolio:latest**  

**Overview:**  
The frontend application is deployed using **Kubernetes best practices** and accessed securely over HTTP using a **self-signed TLS certificate**. The application is exposed externally using an **Ingress resource**, which routes traffic to the **frontend service and pods**. 

**Architecture:**  

<img width="203" height="547" alt="image" src="https://github.com/user-attachments/assets/c0732c9f-9abd-4879-989d-d995efd1d00b" />


1. **DNS / Hosts resolution:** When we enter the domain: **http://foo.bar.com:8080/**, the domain **foo.bar.com** is mapped to **localhost:8080**, as specified in **/etc/hosts** and hence **traffic** goes to **localhost**.
2. **Port forwarding:** **Minikube port-forward** maps **local port 8080** → **ingress controller port 80**. So our request **localhost:8080** reaches **Ingress**.
3. **Ingress controller:** Receives request for **Host: foo.bar.com**, matches the **Ingress rules** and **forwards** request **(decrypted HTTP traffic using TLS)** to the **service** on **port 80**.
4. **Service:** **ClusterIP** Service **load-balances traffic** to the **frontend Deployment pods**.  
5. **Deployment → Pod → Container:** The **Service** routes **traffic** to the **Pods** running the **container**, which exposes **port 3000** internally for the application. Request reaches the **React frontend** inside the container.
6. **Response flows back the same way:** **Container -> Pod -> Service -> Ingress (TLS) -> localhost:8080 -> Broswer**

**Pre-Requisites:**  
1. Minikube installed
2. kubectl installed 
3. Docker installed and logged into DockerHub  

**Steps for accessing the application:**  
1. Clone the repository:  
   **git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps**  
   **cd 'Kubernetes/Frontend Application/My Dockerized Portfolio/K8s'**
2. Start Docker: **colima start** (command varies based on OS and mode of installation)
3. Start Minikube: **minikube start** (Docker Driver is the default driver. Drivers can be specified explicilty using --driver) 
4. Deploy the React frontend: **kubectl apply -f deployment.yml**  
9. Expose the Service: **kubectl apply -f service.yml**  
10. Setup Ingress: **kubectl apply -f ingress.yml**  
11. Forwards traffic from local machine (port 8080) to the Kubernetes Ingress controller: **kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80**
12. Enter the domain name to access the application: **http://foo.bar.com:8080/**
