# Setting up an OpenStack-Ansible Deployment

Our OpenStack infrastructure is deployed and configured using the
OpenStack-Ansible deployment system. This guide will only cover the intricacies
of working with OpenStack-Ansible in our environment.

**PLEASE READ** [the official documentation](https://docs.openstack.org/openstack-ansible/stein/)
before continuing! This documentation does not duplicate the existing official
documentation.

- [Setting up an OpenStack-Ansible Deployment](#setting-up-an-openstack-ansible-deployment)
  - [Setup](#setup)
  - [Reconfiguring](#reconfiguring)
  - [Running](#running)

## Setup

`mgmt01` will be used as our deployment node, so log in to it and then switch
to the root user. Unfortunately, the way OpenStack-Ansible works requires root
permissions.

Next, clone the RITSEC fork of OpenStack-Ansible under `/opt`.

```shell
cd /opt
git clone https://github.com/ritsec/openstack-ansible.git
cd openstack-ansible
```

The contents of `etc/openstack_deploy` in the repository need to be copied to
`/etc/openstack_deploy` on the host. To make this simpler, we will create a
symbolic link pointing back to the repository.

```shell
rm -rf /etc/openstack_deploy
ln -s /opt/openstack-ansible/etc/openstack_deploy /etc/openstack_deploy
```

Lastly, the contents of `/etc/openstack_deploy` need to be updated. While most
of the user variables files are tracked in git, the secrets files and ansible
facts files are not. They either contain sensitive information and therefore
should not be stored in a public repository, or they change so often that
tracking them simply doesn't make sense.

To back up the contents of this directory, we use Vault. The `vault-backup.sh`
and `vault-restore.sh` scripts in this repository can be used to download and
upload the latest copies of these files.

```shell
vault login... # Log in however you normally would to use Vault
cd /opt/openstack-ansible
./vault-restore.sh etc/openstack_deploy
tar -zxf etcopenstack_deploy.tar.gz
rm etcopenstack_deploy.SHA256SUM etcopenstack_deploy.tar.gz
```

Note that the archive is extracted within the repository - if it was extracted
over `/etc/openstack_deploy`, then the symbolic link would be overwritten.

## Reconfiguring

Any configuration changes to the various services that are deployed should be
made in the respective `user_SERVICE.yml` configuration files. These can be
found under `etc/openstack_deploy` in the repository. If making changes to a
service that does not already have a service-specific configuration file,
please add a new one for the service.

Once you have finished reconfiguring, make sure to commit your changes and
update the backup in Vault.

```shell
cd /opt/openstack-ansible
git remote add my-fork https://github.com/YOUR_USERNAME/openstack-ansible.git
git config --global user.name "Your Name"
git config --global user.email "yourgithubemail@example.com"
git add .
git commit -m "Descriptive message" # Or run `git commit' and use vim/nano
git push my-fork master
vault login... # Log in however you normally would to use Vault
./vault-backup.sh etc/openstack_deploy
```

Make sure to fork the repository and push to your fork - do not try to push
directly to the RITSEC OpenStack-Ansible repository! Branch protection has been
enabled for master on that repository. To contribute, you must push to your own
fork and then submit a pull request.

The `git config` steps ensure that your commits are credited properly in the
git log. You should run these commands each time you commit, just in case
someone else has changed the configuration since the last time you committed.
Obviously, this isn't ideal. Suggestions for improving this process are
welcome!

## Running

Running through OpenStack-Ansible in our environment is pretty much the same as
described in the documentation. However, once you are done running the ansible,
you must update the backup in Vault.

```shell
vault login... # Log in however you normally would to use Vault
./vault-backup.sh etc/openstack_deploy
```

Unless you made configuration changes, there should be nothing to commit;
running `git status` should appear similar to the following:

```shell
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

If there are changes, check out the section on [reconfiguring](#reconfiguring).