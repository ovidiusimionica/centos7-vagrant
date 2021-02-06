#!/bin/bash
    
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

yum -y install git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
yum -y install https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.6.6-1.el7.ans.noarch.rpm


yum -y install wget curl java-1.8.0-openjdk-devel nano emacs dnsmasq

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce-19.03.15-3.el7 docker-ce-cli-19.03.15-3.el7 containerd.io

usermod -aG docker vagrant
systemctl enable docker
systemctl start docker

# mkdir -p /home/vagrant/bin
# wget -qO- https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz | tar --transform 's/^openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit//' -xvz -C /home/vagrant/bin

# echo 'export PATH=$PATH:.:/home/vagrant/bin' >> /home/vagrant/.bashrc
