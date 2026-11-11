# Post Installation Instructions for SonarQube

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. It performs automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 30+ programming languages. It provides a quality gate which can be integrated in to the CI pipelines.

## 1. Access the Application

SonarQube is not exposed to the internet. Forward its port to your machine:

```sh
kubectl -n sonarqube port-forward svc/sonarqube-sonarqube 9000:9000
```

Then open http://localhost:9000.

## 2. Login

Username: `admin` \
Password: `${ADMIN_PASSWORD}` (the generated password shown above)

To expose SonarQube to others, put it behind an authenticated Ingress or load balancer of your own.

## 3. User Guide & Official Documentation

For more information, visit the [SonarQube Documentation.](https://docs.sonarsource.com/sonarqube/latest/)
