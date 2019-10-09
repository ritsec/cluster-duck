# Networks

This section contains documentation on all **managed networks**. Managed
networks are networks that are created and operated by the RITSEC Operations
Program and any networks which are used for club operations.

To create a new network page, copy the [template page](./TEMPLATE.md) to a new
file in this directory and fill out all of the page's details. Make sure to
also create a [new VLAN](https://netbox.ritsec.club/ipam/vlans/add/) and a
[new prefix](https://netbox.ritsec.club/ipam/prefixes/add/) for the network in
the club's [netbox instance](https://netbox.ritsec.club).

## Network Pages

### OpenStack

- [Cluster Storage](./cluster-storage.md)
- [Public Storage](./public-storage.md)
- [RITSEC IPMI](./ritsec-ipmi.md)
- [RITSEC Management](./ritsec-mgmt.md)
- [RITSEC VXLAN](./ritsec-vxlan.md)
- [User IPMI](./user-ipmi.md)
- [User Management](./user-mgmt.md)

### AWS

- [aws-default](./aws-default.md)
- [gitlab-public](./gitlab-public.md)
- [gitlab-runners](./gitlab-runners.md)