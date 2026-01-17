******************** **Kubernetes Deployment of Association Backend Application** ********************

This folder contains the **Kubernetes deployment configuration** for the **Association Backend application**, a **.NET backend service** using **MySQL** and **Redis**, running on a **Minikube** cluster.  
**Docker image used**: **aishwaryakr/association-backend:latest**  

**Overview:**  
This project demonstrates a full deployment of a .NET backend application using Kubernetes. It leverages:
1. **.NET API (backend service)**
2. **MySQL (database) with persistent storage using Persistent Volume**
3. **Redis Cache**
4. **Secrets** for sensitive configuration
5. **ConfigMaps** for application configuration
6. **Deployment**, **Service**, and **Ingress** resources for **managing containers**  

**Architecture:**  

<img width="225" height="637" alt="image" src="https://github.com/user-attachments/assets/596bda8b-cc32-4442-bc2d-4e236c8d0091" />


1. **DNS / Hosts resolution:** When we hit the API: **http://associations.backend.com:8080/**, the domain **associations.backend.com** is mapped to **localhost:8080**, as specified in **/etc/hosts** and hence **traffic** goes to **localhost**.
2. **Port forwarding:** **Minikube port-forward** maps **local port 8080** → **ingress controller port 80**. So our request **localhost:8080** reaches **Ingress**.
3. **Ingress controller:** Receives request for **Host: associations.backend.com**, matches the **Ingress rules** and **forwards** request to the **backend-service** on **port 80**.
4. **Service:** **ClusterIP** Service **load-balances traffic** to the **backend Deployment pods**.  
5. **Deployment → Pod → Container:** The **Service** routes **traffic** to the **Pods** running the **container**, which exposes **port 5248** internally for the application. Request reaches the .NET backend inside the container.
6. **Response flows back the same way:** **Container -> Pod -> Deployment -> Service -> Ingress -> localhost:8080 -> POSTMAN**

**Pre-Requisites:**  
1. Minikube installed
2. kubectl installed 
3. Docker installed and logged into DockerHub  

**Steps for accessing the application:**  
1. Clone the repository:  
   **git clone https://github.com/Aishwarya-K-R/Dev-To-DevOps**  
   **cd Kubernetes/K8s**
2. Add the required data to **secrets.yml**  
3. Start Docker: **colima start** (command varies based on OS and mode of installation)
4. Start Minikube: **minikube start** (Docker Driver is the default driver. Drivers can be specified explicilty using --driver)
5. Apply Kubernetes Secrets and ConfigMaps:  
   **kubectl apply -f secrets.yml  
   kubectl apply -f config-map.yml**  
4. Deploy MySQL with persistent volume:    
   **kubectl apply -f mysql-pvc.yml  
   kubectl apply -f mysql-deployment.yml**  
5. Get the name of mysql pod: **kubectl get pods -l app=mysql**
6. Login to MySQL pod: **kubectl exec -it <mysql-pod-name> -- bash**
7. Inside the pod, login to MySQL and create the schemas as per the application requirement: **mysql -u root -p**
8. Deploy Redis: **kubectl apply -f redis-deployment.yml**  
8. Deploy the .NET Backend:
   **kubectl apply -f backend-deployment.yml**
9. Expose Services:  
   **kubectl apply -f backend-service.yml  
   kubectl apply -f mysql-service.yml  
   kubectl apply -f redis-service.yml**  
10. Setup Ingress: **kubectl apply -f k8s/ingress.yml**  
11. Forwards traffic from local machine (port 8080) to the Kubernetes Ingress controller: **kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80**
12. Hit the APIs in **POSTMAN** to access the application: **http://associations.backend.com:8080/**
