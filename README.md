## Purpose

This repo contains the bare minimum to get started using disposable development
environments through [Vagrant](http://www.vagrantup.com/) and the provisioning
services provided by [SaltStack](http://saltstack.com/) to build a LAMP stack.

## Requirements

In order to use this you need to have
[Vagrant installed](http://docs.vagrantup.com/v2/installation/).

Since 1.3, Vagrant has had native Salt support. If you're running an older
version of Vagrant for some reason, you'll need to have the
[Salty Vagrant plugin](https://github.com/saltstack/salty-vagrant) installed.

Once you have Vagrant installed, installing the Salty Vagrant plugin is as
simple as running `$ vagrant plugin install vagrant-salt` from the commandline.

## Provisioning

To provision your Vagrant LAMP server, clone this repo and run `$ vagrant up` in
the same directory.

Salt will install the most current versions of Apache, PHP and MySQL. Vagrant
will open up port 8080. Salt will also install a full version of Vim on your
server to allow for editing.

## Please Note

This provisioning currently installs MySQL without a root user password.

This provisioning allows for you to make changes to the
`/salt/roots/salt/apache2.conf` file and will permeate that through to your
server with a `$ salt-call state.highstate` on your guest machine.

Lastly, I have found that the `salt.run_highstate = true` configuration in the
Vagrantfile occasionally hangs. If this happens, `ctrl-c` during this part of
the Vagrant build process and run:

`$ vagrant ssh`  
`$ salt-call state.highstate`

to be sure that your guest machine has indeed run the Salt provisioning
process.
