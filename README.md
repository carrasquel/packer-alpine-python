# packer-alpine-python

Packer template for Alpine Linux ready for Python development

Build a virtual machine image for [Alpine linux](https://www.alpinelinux.org) using [Packer](https://www.packer.io) with Python 3.10 already installed.

    packer build alpine-python.json

This Packer template will build a [VirtualBox](https://www.virtualbox.org) VM (OVA) from an Alpine ISO image. Networking is configured for DHCP and an SSH user is created (default `python` password `python`) with sudo privileges.

**Security Note:** The Vagrant [insecure public key](https://github.com/hashicorp/vagrant/tree/master/keys) has been added. You can replace `http/ssh.keys` to provide your own secure ssh key.

You can customize this login

    packer build -var=ssh_username=youruser -var=ssh_password=yourpassword

## Installed packages and software

- Python (3.11.0)
- Git
- Vim

Further customization is possible by overriding other variables, or editing `alpine.json` or `http/answers`.

## Vagrant Support

[Vagrant](https://vagrantup.com) is not required to build the image. However, the image can easily be turned into a [Vagrant Base Box](https://www.vagrantup.com/docs/boxes/base). See the [vagrant](vagrant/README.md) section for more details.

These Vagrant boxes are also available on [Vagrant Cloud](https://app.vagrantup.com/bobfraser1).