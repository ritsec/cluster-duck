# mgmt03

This node will be used to run various management and control plane services for
the RITSEC Cloud.

## Details

- **FQDN**: mgmt03.ritsec.co
- **Type**: Device
- **Netbox link**: https://netbox.ritsec.club/dcim/devices/3/
- **Operating System**: Ubuntu 18.04.2
- **Remote Accessibility**
  - SSH
  - IPMI
- **Primary Role**: _this node has no primary role at this time_
- **Secondary Roles**
  - DNS server (slave for ritsec.co and 10.0.10.in-addr.arpa)

## Host Messages

### 21 October 2019 @ 20:28 EST - Sean Newman

Bootstrapping for OpenStack-Ansible has been completed.

### 16 October 2019 @ 00:47 EST - Sean Newman

Ceph has been sucessfully redeployed.

### 15 October 2019 @ 12:46 EST - Sean Newman

Configured host to use the Vault SSH CA for SSH authentication.

### 8 October 2019 @ 16:32 EST - Sean Newman

Due to the retirement of the C6100, this host has been migrated to the hardware
that previously hosted nova03. A fresh installation of Ubuntu 18.04.3 has been
performed, and bind9 was manually installed and configured.

### 10 May 2019 @ 23:25 EST - Sean Newman

Operating system has been installed, and the host is accessible over SSH.

## Related KBs

- [KB-0004: C6100 Retirement](../kbs/KB-0004.md)
