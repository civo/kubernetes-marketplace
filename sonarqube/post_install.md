# Post Installation Instructions for SonarQube

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. It performs automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 30+ programming languages. It provides a quality gate which can be integrated in to the CI pipelines.

## 1. Get the Application URL

To access the SonarQube application, follow these steps:

### a. Retrieve the Load Balancer IP 

```sh
export SERVICE_IP=$(kubectl get svc --namespace sonarqube sonarqube-sonarqube -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
```

### b. Access the Application

Visit to the localhost from your browser:

` echo http://$SERVICE_IP:9000 `

Example - `http://74.220.19.252:9000`

## 2. Default Credentials
The default credentials for SonarQube are:

Username: `admin` \
Password: `admin`

SonarQube prompts to change the default password after the first login.

## 3. User Guide & Official Documentation

For more information, visit the [SonarQube Documentation.](https://docs.sonarsource.com/sonarqube/latest/)

