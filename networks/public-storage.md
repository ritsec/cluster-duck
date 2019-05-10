# Public Storage

This is the public Ceph network. It is used by Ceph cluster servers and clients
to access data in the Ceph cluster.

This network, like the other storage network, is a 10 gigabit network. It is
separated and inaccessible from the 1 gigabit networks.

## Details

- **VLAN ID**: 9
- **Subnet**: 10.0.9.0/24
- **Gateway**: 10.0.9.254
- **Netbox VLAN link**: https://netbox.ritsec.club/ipam/vlans/8/
- **Netbox Prefix link**: https://netbox.ritsec.club/ipam/prefixes/9/

## Related KBs

_add links to any KB articles that are related as they are written_

- _there are no related KBs_