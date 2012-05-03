#!/bin/bash

# install time server
apt-get install ntp
service ntp restart

# modify timeserver configuration
sed -e "
/^server ntp.ubuntu.com/i server 127.127.1.0
/^server ntp.ubuntu.com/i fudge 127.127.1.0 stratum 10
/^server ntp.ubuntu.com/s/^.*$/server ntp.ubutu.com iburst/;
" -i /etc/ntp.conf

# install tgt
apt-get install tgt
service tgt start

# openiscsi-client
apt-get install open-iscsi open-iscsi-utils

echo "#################################################################################################
Go edit your /etc/network/interfaces file to look something like this:

auto eth0 
iface eth0 inet static
 address 10.42.0.6
 network 10.42.0.0
 netmask 255.255.255.0
 broadcast 10.42.0.255
 gateway 10.42.0.1

auto eth1

After you are done, do a '/etc/init.d/networking restart'
#################################################################################################
"


exit