# Post Installation Instructions for SonarQube

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. It performs automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 30+ programming languages. It provides a quality gate which can be integrated in to the CI pipelines.

## 1. Get the Application URL

To access the SonarQube application, follow these steps:

### a. Retrieve the SonarQube Pod Name

```sh
export POD_NAME=$(kubectl get pods --namespace sonarqube -l "app=sonarqube,release=sonarqube" -o jsonpath="{.items[0].metadata.name}")
```
### b. Forward the Port

```kubectl port-forward $POD_NAME 8080:9000 -n sonarqube```

### c. Access the Application

Visit to the localhost from your browser:

```http://127.0.0.1:8080```

## 2. Default Credentials
The default credentials for SonarQube are:

Username: admin
Password: admin

SonarQube prompts to change the default password after the first login.

## 3. User Guide & Official Documentation

For more information, visit the [SonarQube Documentation.](https://docs.sonarsource.com/sonarqube/latest/)

