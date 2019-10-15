Vault SSH CA
============

Once [HashiCorp Vault has been set up](vault-setup.md), it can be configured to
act as an SSH Certificate Authority. This will make the management of SSH keys
much easier, since we won't have to manage key distribution.

## Steps

These steps are largely taken from the [Vault documentation](https://www.vaultproject.io/docs/secrets/ssh/signed-ssh-certificates.html)
on the subject, with light modifications.

### Client Key Signing Setup

First, the SSH secrets engine needs to be enabled.

```shell
$ vault secrets enable -path ssh-client-signer-test ssh
Success! Enabled the ssh secrets engine at: ssh-client-signer-test/
```

Next we'll tell vault to generate a new key pair for the SSH CA.

```shell
$ vault write ssh-client-signer-test/config/ca generate_signing_key=true
Key           Value
---           -----
public_key    ssh-rsa blahblahblah
```

This public key needs to be copied to each host, and sshd needs to be
reconfigured to use it with the `TrustedUserCAKeys` attribute. This can be
accomplished with our Ansible repository, which is already set up to configure
hosts properly. **However**, this role will use default values by default, so
if you have any custom SSH configurations on the host (like port number) make
sure to configure those variables as well so they make their way into the final
`sshd_config`.

Now before we can sign any client keys and start logging in, roles have to be
created that configure how the client keys will be signed. We will create a
single role for both OpenStack and AWS hosts:

```json
{
  "default_user": "ops",
  "key_type": "ca",
  "allowed_users": "*",
  "ttl": "24h",
  "default_extensions": [
    {
      "permit-pty": ""
    }
  ],
  "allow_user_certificates": true
}
```

For a full explanation on all available options, see the
[relevant documentation](https://www.vaultproject.io/api/secret/ssh/index.html#create-role)
on the subject. Here's a quick summary of the above role:

- If no username is requested, the signed certificate will be created for the
  `ops` user
- Certificates may be requested for any users
- Certificates will expire after 1 day
- User certificiates will be generated with the permit-pty extension

Write the above JSON to a file named `role.json`, and then run the following
command to add the role to Vault:

```shell
$ vault write ssh-client-signer-test/roles/client @role.json
Success! Data written to: ssh-client-signer-test/roles/client
```

### Getting Access

Once the SSH CA has been configured as above, we can start signing certificates
to gain access. First, generate the SSH key that you will use with Operations
Program hosts. If you're copying commands, make sure to change the name in the
key's comment!

```shell
$ ssh-keygen -f ~/.ssh/ritsec-ops -t rsa -b 2048 -C "RITSEC Ops - Newman"
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/sean/.ssh/ritsec-ops.
Your public key has been saved in /home/sean/.ssh/ritsec-ops.pub.
The key fingerprint is:
SHA256:0MGa3lvlA0ZNnwhh0m8Yb0ELHPc/UROb672JR1Qyyps RITSEC Ops - Newman
The key's randomart image is:
+---[RSA 2048]----+
|       .oo**+  oo|
|       ..+=+o=o.*|
|      .o.. *oo+*.|
|      o.  + O  oo|
|     . .S. * o.o.|
|      . . . E ..o|
|         o   ....|
|        .     ..o|
|             ..o |
+----[SHA256]-----+
```

Next we need to get two different signed public keys - one for OpenStack, and
one for AWS. The reason for two different signed pubkeys is that each one has
a subject, which is the user that you are allowed to log in as with the key. As
of this writing, the `ops` user is used on OpenStack and `ubuntu` is generally
used on AWS. Two users, two keys.

```shell
$ vault write -field signed_key ssh-client-signer/sign/client \
    public_key=@$HOME/.ssh/ritsec-ops.pub \
    valid_principals=ops,ubuntu > ~/.ssh/ritsec-ops-signed.pub
$ ssh-keygen -Lf ~/.ssh/ritsec-ops-signed.pub
/home/sean/.ssh/ritsec-ops-signed.pub:
        Type: ssh-rsa-cert-v01@openssh.com user certificate
        Public key: RSA-CERT SHA256:0MGa3lvlA0ZNnwhh0m8Yb0ELHPc/UROb672JR1Qyyps
        Signing CA: RSA SHA256:uGYluwETcMcDX1mrIFIzHcBEQPtjqP5aPtEva1iDNCs (using ssh-rsa)
        Key ID: "vault-userpass-newman-d0c19ade5be503464d9f0861d26f186f410b1cf73f51139bebbd89475432ca9b"
        Serial: 9150904936519911497
        Valid: from 2019-10-15T13:43:38 to 2019-10-16T13:44:08
        Principals: 
                ops
                ubuntu
        Critical Options: (none)
        Extensions: 
                permit-pty
```

Boom. We now have the keys to the castle. To use these signed certificates,
here's an example SSH client configuration snippet:

```
host *.ritsec.co
  IdentityFile ~/.ssh/ritsec-ops
  IdentityFile ~/.ssh/ritsec-ops-signed.pub

host *.ritsec.cloud
  IdentityFile ~/.ssh/ritsec-ops
  IdentityFile ~/.ssh/ritsec-ops-signed.pub
```

This configuration will need to be modified for users and ports, but provides a
good base for connecting to private and public cloud hosts. Note that both the
private key and the signed public key need to be passed as identity files for
this to work.