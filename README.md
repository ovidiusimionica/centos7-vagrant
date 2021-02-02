# Centos7 Vagrant

This repo provides a template Vagrantfile to create a Centos7 virtual machine using one of: VirtualBox software hypervisor/ KVM / VMware.
After setup is complete you will have a virtual machine running on your local machine.

## Contact

## Streamlined setup

1) Install dependencies

* [VirtualBox][virtualbox] 4.3.10 or greater.
* [Vagrant][vagrant] 1.6.3 or greater.

2) Clone this project and get it running!

```
git clone https://github.com/ovidiusimionica/centos7-vagrant/
cd centos7-vagrant
```

3) Startup and SSH

There are three "providers" for Vagrant with slightly different instructions.
Follow one of the following two options:

**KVM / VirtualBox Provider**

The KVM / VirtualBox provider is the default Vagrant provider. Use this if you are unsure.

```
vagrant up
vagrant ssh
```

**VMware Provider**

The VMware provider is a commercial addon from Hashicorp that offers better stability and speed.
If you use this provider follow these instructions.

VMware Fusion:
```
vagrant up --provider vmware_fusion
vagrant ssh
```

VMware Workstation:
```
vagrant up --provider vmware_workstation
vagrant ssh
```

``vagrant up`` triggers vagrant to download the Centos7 image (if necessary) and (re)launch the instance

``vagrant ssh`` connects you to the virtual machine.
Configuration is stored in the directory so you can always return to this machine by executing vagrant ssh from the directory where the Vagrantfile was located.

4) Get started [using Centos7][using-centos7]

[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/downloads.html
[using-centos7]: https://docs.centos.org/en-US/docs/

#### Shared Folder Setup

There is optional shared folder setup.
You can try it out by adding a section to your Vagrantfile like this.

```
config.vm.network "private_network", ip: "172.17.8.150"
config.vm.synced_folder ".", "/home/vagrant/share", id: "share", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']
```

After a 'vagrant reload' you will be prompted for your local machine password.


#### Configuration

The Vagrantfile will parse a `config.rb` file containing a set of options used to configure your Centos7 cluster.
See `config.rb.sample` for more information.

## Cluster Setup

Launching a Centos7 cluster on Vagrant is as simple as configuring `$num_instances` in a `config.rb` file to 3 (or more!) and running `vagrant up`.

## New Box Versions

If you want to start from the most up to date version you will need to make sure that you have the latest box file of Centos7. You can do this by running
```
vagrant box update
```


## Docker Forwarding

By setting the `$expose_docker_tcp` configuration value you can forward a local TCP port to docker on
each Centos7 machine that you launch. The first machine will be available on the port that you specify
and each additional machine will increment the port by 1.

Then you can then use the `docker` command from your local shell by setting `DOCKER_HOST`:

    export DOCKER_HOST=tcp://localhost:2375

## Troubleshooting
If vagrant fails to run successfully, first make sure that the latest version of the centos7-vagrant project has been downloaded, then run
`vagrant destroy -f` to remove old machines, `vagrant box update` to update the OS box.
