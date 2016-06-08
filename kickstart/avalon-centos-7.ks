install
lang en_US
keyboard us
network --onboot yes --bootproto dhcp
rootpw  --iscrypted $6$QjE38w7tKUDDMq1R$lNTufHdtwCrLJFrZS6p5QtMwJRVkSB0ULRgoIKzmXoOEZqiCwMFFGqh6wCPWRhiA0wYkMfd8pRcD.5P6PQ8ou1
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --disabled
timezone --utc America/Chicago
services --enabled=NetworkManager,sshd
eula --agreed
ignoredisk --only-use=sda
reboot

bootloader --location=mbr
zerombr
clearpart --all --initlabel
autopart

cdrom
repo --name=base --baseurl=http://ftp.osuosl.org/pub/centos/7/os/x86_64/
repo --name=puppetlabs-products --baseurl=http://yum.puppetlabs.com/el/7/products/x86_64/
repo --name=puppetlabs-deps --baseurl=http://yum.puppetlabs.com/el/7/dependencies/x86_64/

logging --level=info

##############################################################################
#
# packages part of the KickStart configuration file
#
##############################################################################
%packages
@ base
@ core 
@ X Window System
libselinux-ruby
puppetlabs-release
puppet
gnome-classic-session
gnome-terminal
nautilus-open-terminal
control-center
liberation-mono-fonts
openssh-server
%end

##############################################################################
#
# post installation part of the KickStart configuration file
#
##############################################################################
%post
yum update -y
unlink /etc/systemd/system/default.target
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

restorecon -r /home
%end
