# Jenkins Pipeline Task

This project demonstrates a CI/CD pipeline setup using Jenkins, Docker, and Maven for a simple Java application. The pipeline automates the build, test, and deployment processes, ensuring a streamlined workflow for continuous integration and delivery.

## Features

- **Java Application**: A simple Java application built with Maven
- **Dockerized Setup**: Both the Java app and Jenkins are containerized using Docker
- **CI/CD Pipelines**:
  - **CI Pipeline**: Builds, tests, and pushes the Docker image to Docker Hub
  - **CD Pipeline**: Pulls the Docker image and deploys it locally
- **Jenkins Configuration as Code (JCasC)**: Automates Jenkins setup, including plugins and credentials

## Prerequisites

- Docker and Docker Compose installed
- A Docker Hub account
- A SSH access key to this GitHub repository (read-only)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone git@github.com:Amit-Shahal/jenkins-pipeline-task.git
cd jenkins-pipeline-task
```

### 2. Configure Environment Variables

Create a `.env` file in the `jenkins` directory with your credentials:

```env
JENKINS_ADMIN_PASSWORD=your_secure_password
JENKINS_URL=http://localhost:8080/
DOCKERHUB_USERNAME=your-dockerhub-username
DOCKERHUB_PASSWORD=your-dockerhub-password
```

### 3. Configure path to Github SSh Private key in build.sh file

The build.sh script requires a path to your GitHub SSH private key for repository access. By default, it looks for the key at ~/.ssh/jenkins_user.

### 4. Start Jenkins

Run the following commands to build and start Jenkins:

```bash
cd jenkins
./build.sh
```

Access Jenkins at [http://localhost:8080/](http://localhost:8080/)



## Configuration

### Jenkins Configuration as Code

The Jenkins setup is automated using JCasC. Configuration files are located in `jenkins/casc.yaml`.

### Pipeline Configuration

Pipeline definitions are stored as Jenkinsfiles in the repository root:
- `Jenkinsfile-ci` - CI Pipeline
- `Jenkinsfile-cd` - CD Pipeline

