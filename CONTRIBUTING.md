# Contribution Guidelines

Thank you for interest in contributing to the Civo Kubernetes Marketplace! To ensure consistency and quality of applications available on the marketplace we have prepared this guideline document. It details the criteria for acceptance into the marketplace, maintenance requirements and responsibilities for applications, and measures we may take concerning submitted applications if issues are discovered.

### Acceptance Criteria

In general, we will approve all Marketplace applications for inclusion, as long as they add an element of functionality not provided by other applications, and have been tested to work on the default version of k3s deployed on the creation of a new cluster on Civo.

To submit an application to the Marketplace, make sure you include all the required information specified in the README. There is a Pull Request template that has a checklist of requirements for applications to be accepted.

### Glossary

- Marketplace application: A Kubernetes application submitted to the Civo Kubernetes Marketplace
- Upstream project: The project codebase in its official repository, updated by the project's authors and contributors
- Submitter: The person(s) submitting an application for inclusion in the Civo Kubernetes Marketplace, having written the required code and supporting information
- Maintainer: The person in charge of the application. By default, the Submitter.

### Maintainer Responsibilities

As a submitter of an application, you will also agree to become its maintainer. As a maintainer, your responsibilities will be to:
- Monitor the upstream version of your submitted application for updates and submit pull requests to update the application's version when appropriate, such as when security updates are released.
- Respond promptly with a decision and feedback to pull requests from other users to your application on this repository
- Notify Civo if you wish to step away from the maintainer role for your application

### Application Maintenance and Removal

We may remove an application from the Civo Marketplace with no notice if a severe vulnerability is discovered. Other reasons for removing an application are, but are not limited to:
- An application becoming abandoned or unmaintained by the upstream project
- A Marketplace application becoming abandoned or unmaintained by the submitter or maintainer
- A Marketplace application becoming superseded in function by another provided service or application
