Nova Reset
==========

While there is an Ansible playbook to help remove a Nova node from an OpenStack
deployment, this is for removing a node from an existing deployment. If the API
and database that Nova was deployed against is no longer accessible, the
services have to be manually nuked. The following steps can be used to remove
these services:

```shell
# Stop and disable services
sudo systemctl stop neutron-linuxbridge-agent.service
sudo systemctl disable neutron-linuxbridge-agent.service
sudo systemctl stop lxc-dnsmasq.service
sudo systemctl disable lxc-dnsmasq.service
sudo systemctl stop ceilometer-polling.service
sudo systemctl disable ceilometer-polling.service

# Remove openstack directories
sudo rm -rf /etc/nova
sudo rm -rf /etc/neutron
sudo rm -rf /openstack

# Stop and destroy all LXC containers
for lxc in $(sudo lxc-ls)
do
  sudo lxc-stop ${lxc}
  sudo lxc-destroy ${lxc}
done
```