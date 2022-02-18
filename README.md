# Cloud Orchestrator

Cloud Orchestrator is a distribution for cloud administrators and operators.
This distribution can manage resources from cloud providers such as Amazon EC2, Kubernetes and OpenStack.

Out of the box, the distribution provides management for AWS EC2, Kubernetes, OpenStack,
Amazon VPC/Networking and granular user permissions.

Cloud Orchestrator's core functionality is built using the [Cloud module](https://www.drupal.org/project/cloud).

## Installing Cloud Orchestrator using Composer

The recommended way to install Cloud Orchestrator is using Composer.

```
composer create-project naoi/cloud_orchestrator cloud_orchestrator
```

After the composer project is created, point your web server to `cloud_orchestrator/docroot`.  Then
run the normal Drupal installer.

##  Contributing

Issues are tracked on [drupal.org][issue_queue].  Please do not submit support requests through GitHub.

[issue_queue]:  https://www.drupal.org/project/issues/cloud_orchestrator "Cloud Orchestrator Issue Queue"
[cloud_module]: https://www.drupal.org/project/cloud "Cloud module"

## Known Issues
