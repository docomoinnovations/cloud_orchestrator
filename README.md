# Cloud Orchestrator

[Cloud Orchestrator](https://cloud.airgap.host) is a Drupal cloud management distribution tailored for cloud administrators and operators.

The distribution manages resources in public and private clouds. Version 4.x includes support for Amazon EC2 and Amazon VPC/Networking, Kubernetes, OpenStack, and Terraform.

Major features include
- Multiple cloud support
- Self service portal
- Infrastructure insights

Cloud Orchestrator's functionality is built using the [Cloud module](https://www.drupal.org/project/cloud).

## Installing Cloud Orchestrator using Composer

The recommended way to install Cloud Orchestrator is using Composer.

```
composer create-project docomoinnovations/cloud_orchestrator cloud_orchestrator
```

To use 4.6.0 use the following command.

```
composer create-project docomoinnovations/cloud_orchestrator:4.6.0 cloud_orchestrator
```

After the composer project is created, point your web server to `cloud_orchestrator/docroot`.  Then
run the normal Drupal installer.

## Installing Cloud Orchestrator using AWS CloudFormation template

Alternatively, you can use the [AWS CloudFormation Template](https://cloud-orchestrator.s3.amazonaws.com/cfn/cloud_orchestrator_single.yaml) to launch
the Cloud Orchestrator stack on AWS EC2.

After the stack is built, check that the build script has completed by logging into your instance with SSH using
the `SSHAccess` value under the `Outputs` tab.  Follow the build script progress with
`tail -f /var/log/cloud-init-output.log`.  The build script takes about 10 minutes to complete.

When the script has completed, click on the `DrupalUrl` under the `Outputs` tab.  Follow the standard
Drupal installation process.

##  Video Resources

__Cloud Orchesration Introduction__
- [Cloud Orchestrator Introduction](https://www.youtube.com/watch?v=G-IOjrFZfRs)
- [Multiple Cloud Orchestration Explained](https://www.youtube.com/watch?v=nhFVixLdFyU&t=25s)

__Installation__
- [Installing Cloud Orchestrator with Composer](https://www.youtube.com/watch?v=iryM7H-Xalw)
- [Installing Cloud Orchestrator with Cloud Formation](https://www.youtube.com/watch?v=M-0mL-L0TyA)

__Setting up EC2 in Cloud Orchestrator__
- [Launching EC2 Instance](https://www.youtube.com/watch?v=Ukde63dIU0k)
- [Create SSH Key Pair](https://www.youtube.com/watch?v=Kl0aJiqfBXk)
- [Import AMI Image](https://www.youtube.com/watch?v=3wSRiA7QJbA)
- [Create Launch Templates](https://www.youtube.com/watch?v=58wKMN7ROgw)
- [Launch EC2 Instance](https://www.youtube.com/watch?v=gK1nKwpc16M)

##  Contributing

Issues are tracked on [drupal.org].  Please do not submit support requests through GitHub.

- [Cloud Orchestrator issue queue](https://www.drupal.org/project/issues/cloud_orchestrator)
- [Cloud module issue queue](https://www.drupal.org/project/cloud)

## Known Issues

## License

Cloud Orchestrator is released under the terms of the [GPLv2 license](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#SEC1).