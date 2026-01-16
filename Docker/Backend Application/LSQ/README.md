******************** **Backend Application Containerization using Docker** ********************

This project demonstrates **production-ready containerization of a .NET Backend Application** using **Docker**, focusing on image optimization, service orchestration, and data persistence.

**Features:**  
**Dockerized** the backend using Docker Compose with **three containers**:
- .NET Backend API
- MySQL (persistent database storage using Docker volumes)
- Redis (caching layer)

**Implemented two Docker build strategies:**
1. **Single-stage build** (development baseline): Image Size of **749 MB**
2. **Multi-stage build** (production optimized): Image Size of **102 MB**

**Outcomes & Measurable Impact:**
1. Containers orchestrated: **3 (.NET + MySQL + Redis)**
2. Docker volume enabled: **100% MySQL data persistence** across restarts
3. Image size reduction: **749 MB → 102 MB**
4. Optimization achieved: **86.38% reduction**

**Technology Stack:**
1. Backend: ASP.NET Core
2. Containerization: Docker
3. Orchestration: Docker Compose
4. Database: MySQL (Volumes)
5. Cache: Redis

**Steps for Implementation:**
1. Clone the Repository:  
**git clone 'https://github.com/Aishwarya-K-R/Dev-To-DevOps'      
cd 'Docker/Backend Application/LSQ'**  
2. Install **Docker** and verify the version:  
**docker --version      
docker-compose --version**  
3. Build and Run Services using Docker Compose: **docker-compose up --build**  
4. Verify Running Containers: **docker ps**  
5. Access the Backend APIs: **http://localhost:5248/**  
6. Stop and Clean Up Services: **docker-compose down**

