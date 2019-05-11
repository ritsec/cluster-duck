# Hosts

This section contains documentation on all **managed hosts**. Managed hosts are
hosts that are created and operated by the RITSEC Operations Program and any
networks which are used for club operations.

To create a new host page, copy the [template page](./TEMPLATE.md) to a new
file in this directory and fill out all of the page's details. Make sure to
also create a [new host](https://netbox.ritsec.club/dcim/devices/add/) or a
[new VM](https://netbox.ritsec.club/virtualization/virtual-machines/add/) for
the host in the club's [netbox instance](https://netbox.ritsec.club).

The primary role installed on the host, such as an Active Directory Domain
Controller, should be documented under **Primary Role** on the host page. Then,
any additional roles (such as DNS and DHCP) should be documented under
**Secondary Roles** on the host page. Remote access services, such as SSH, RDP,
WinRM, etc. should not be documented under those sections, unless the host is a
"jump host" for remotely accessing other hosts. For example, a host used as an
SSH Bastion host would have "SSH Bastion" set as the primary role, or listed
under the host's secondary roles.

Remote access services should be listed under **Remote Accessibility** on the
host page. All applicable remote access services should be listed. Several
common remote access services are listed in the template host page to make, but
it is not an exhaustive list of possible or acceptable options.

## Host Messages

Host messages are a method of logging the history of a host. When a host is
created, a host message should be created that explicitly documents when that
host was created. While this information can be implied by the creation date of
the host page and the creation date of the netbox entry, it should still be
explicitly metioned in a host message. If any services are installed
immediately after the host is created, this information can also be included in
the initial host message.

After the initial host message, a new host message should be created for each
change or interaction with the host. Logging into the host over SSH and other
small, common interactions do not warrant the creation of a new host message.
However, things like installing software updates, installing new software,
configuration changes, and the termination of the host should all be included
in the host messages. Finally, anything that warrants the creation of a KB
should be included in the host messages. Problems that are too small or simple
for a KB should also be briefly documented in the host messages.

The host messages section of a host page should be ordered in reverse
chronological order; that is, the most recent entries should come first. Use
the example host message in the template page as a reference for how to format
host messages.

## Host Pages

- [nova01](./nova01.md)
- [nova02](./nova02.md)
- [nova03](./nova03.md)
- [nova04](./nova04.md)
- [nova05](./nova05.md)
- [nova06](./nova06.md)
- [nova07](./nova07.md)
- [nova08](./nova08.md)
- [nova09](./nova09.md)
- [nova10](./nova10.md)
- [nova11](./nova11.md)
- [nova12](./nova12.md)
- [mgmt01](./mgmt01.md)
- [mgmt02](./mgmt02.md)
- [mgmt03](./mgmt03.md)
- [stor01](./stor01.md)
- [stor02](./stor02.md)
- [stor03](./stor03.md)