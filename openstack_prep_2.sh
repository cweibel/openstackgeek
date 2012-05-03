#!/bin/bash

# bridge stuff
apt-get install bridge-utils

# rabbit food
apt-get install rabbitmq-server memcached python-memcache

# kvm
apt-get install kvm libvirt-bin

echo "#################################################################################################
You'll need a LVM for 'nova-volumes'.  This assumes you have an empty disk spinning at /dev/sdb:

fdisk /dev/sdb

Create a new partition by hitting 'n' then 'p'.  Use the defaults.  Type 't' then '8e' to set the 
partition to the LVM type.  Hit 'w' to write and exit.

Next, do a:

pvcreate -ff /dev/sdb1
vgcreate nova-volumes /dev/sdb1

Keep in mind you should use whatever device handle your system has.  Be careful!
#################################################################################################
"
exit