# gitlab-bastion

This host serves as an SSH bastion host to access all other resources in the
gitlab-main VPC in AWS. It also hosts the GitLab runner used to autoprovision
GitLab CI instances.

## Details

- **FQDN**: jump.ritsec.cloud
- **Type**: VMM
- **Netbox link**: https://netbox.ritsec.club/virtualization/virtual-machines/2/
- **Operating System**: Ubuntu 18.04.2
- **Remote Accessibility**
  - SSH
- **Primary Role**: SSH bastion
- **Secondary Roles**
  - GitLab CI runner autoscaler

## Host Messages

### 8 October 2019 @ 1:42 EST - Sean Newman

Host page was created. This was deployed using terraform and manually
configured some time ago.

## Related KBs

- _there are no related KBs_