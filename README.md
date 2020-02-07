# Cloud Orchestrator

Cloud Orchestrator is a distribution for cloud administrators and operators.
This distribution can manage resources from cloud providers such as AWS EC2, Kubernetes and OpenStack.

Out of the box, the distribution provides management for AWS EC2, Kubernetes(8.x-2.0-rc1), OpenStack(8.x-2.0-rc1),
AWS VPC/Networking and granular user permissions.

Cloud Orchestrator's core functionality is built using the [Cloud module](https://www.drupal.org/project/cloud).

## Installing Cloud Orchestrator using Composer

The recommended way to install Cloud Orchestrator is using Composer.

```
composer create-project docomoinnovations/cloud_orchestrator cloud_orchestrator
```

To try out 8.x-2.0-rc1 use the following command.

```
composer create-project docomoinnovations/cloud_orchestrator:8.2.0-rc1 cloud_orchestrator
```

After the composer project is created, point your web server to `cloud_orchestrator/docroot`.  Then
run the normal Drupal installer.

## Installing Cloud Orchestrator using AWS CloudFormation template

Alternatively, you can use the [AWS CloudFormation Template](cfn/cloud_orchestrator_cfn.yml) to launch
the Cloud Orchestrator stack on AWS EC2.

After the stack is built, check that the build script has completed by logging into your instance with SSH using
the `SSHAccess` value under the `Outputs` tab.  Follow the build script progress with
`tail -f /var/log/cloud-init-output.log`.  The build script takes about 10 minutes to complete.

When the script has completed, click on the `DrupalUrl` under the `Outputs` tab.  Follow the standard
Drupal installation process.

##  Contributing

Issues are tracked on [drupal.org][issue_queue].  Please do not submit support requests through GitHub.

[issue_queue]:  https://www.drupal.org/project/issues/cloud_orchestrator "Cloud Orchestrator Issue Queue"
[cloud_module]: https://www.drupal.org/project/cloud "Cloud module"

## Known Issues
1. 01-31-2020 - [Issue 3110911](https://www.drupal.org/project/cloud/issues/3110911)
   Do not enable aws_cloud if a `Add Kubernetes Cloud Service Provider`
   is not completed.

   When adding a Metrics Server enabled Kubernetes cluster, the metrics
   importing operation can potentially take a long time to complete.
   During this process,  there might be database corruption if the aws_cloud
   module is enabled.

   As a workaround, enable aws_cloud when the server is idle and not processing
   a `Add Kubernetes Cloud Service Provider` operation.
