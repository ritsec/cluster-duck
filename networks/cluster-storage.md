# Cluster Storage

This is the private Ceph cluster network. It is used by the storage nodes for
cluster-specific traffic, such as balancing objects across failure domains.

This network, like the other storage network, is a 10 gigabit network. It is
separated and inaccessible from the 1 gigabit networks.

## Details

- **VLAN ID**: 8
- **Subnet**: 10.0.8.0/24
- **Gateway**: 10.0.8.254
- **Netbox VLAN link**: https://netbox.ritsec.club/ipam/vlans/7/
- **Netbox Prefix link**: https://netbox.ritsec.club/ipam/prefixes/8/

## Related KBs

_add links to any KB articles that are related as they are written_

- _there are no related KBs_