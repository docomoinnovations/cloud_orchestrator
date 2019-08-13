# Cloud Orchestrator

Cloud Orchestrator is a distribution for cloud administrators and operators.
This distribution can manage resources from cloud providers such as AWS EC2 with future support for
Kubernetes, and OpenStack coming very shortly.

Out of the box, the distribution provides management for AWS EC2, AWS VPC/Networking and granular
user permissions.

Cloud Orchestrator's core functionality is built using the [cloud_module].

## Installing Cloud Orchestrator
The recommended way to install Cloud Orchestrator is using composer.  All it takes is one command

```
composer create-project docomoinnovations/cloud_orchestrator --stability=dev cloud_orchestrator
```

After the composer project is created, point your web server to `cloud_orchestrator/docroot`.  Then
run the normal Drupal installer.

##  Contributing
Issues are tracked on [drupal.org][issue_queue].  Please do not submit support requests through GitHub.

[issue_queue]:  https://www.drupal.org/project/issues/cloud_orchestrator "Cloud Orchestrator Issue Queue"
[cloud_module]: https://www.drupal.org/project/cloud "Cloud module"