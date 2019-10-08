# mgmt01

This node will be used to run various management and control plane services for
the RITSEC Cloud.

## Details

- **FQDN**: mgmt01.ritsec.co
- **Type**: Device
- **Netbox link**: https://netbox.ritsec.club/dcim/devices/7/
- **Operating System**: Ubuntu 18.04.3
- **Remote Accessibility**
  - SSH
  - IPMI
- **Primary Role**: _this node has no primary role at this time_
- **Secondary Roles**
  - DNS server (master for ritsec.co and 10.0.10.in-addr.arpa)

## Host Messages

### 8 October 2019 @ 16:28 EST - Sean Newman

Due to the retirement of the C6100, this host has been migrated to the hardware
that previously hosted nova01. A fresh installation of Ubuntu 18.04.3 has been
performed, and bind9 was manually installed and configured.

### 10 May 2019 @ 23:15 EST - Sean Newman

Operating system has been installed, and the host is accessible over SSH.

## Related KBs

- [KB-0004: C6100 Retirement](../kbs/KB-0004.md)