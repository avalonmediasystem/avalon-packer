install
lang en_US
keyboard us
network --onboot yes --bootproto dhcp
rootpw  --iscrypted $6$QjE38w7tKUDDMq1R$lNTufHdtwCrLJFrZS6p5QtMwJRVkSB0ULRgoIKzmXoOEZqiCwMFFGqh6wCPWRhiA0wYkMfd8pRcD.5P6PQ8ou1
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --disabled
user --name=vagrant --groups=wheel --password=$6$QjE38w7tKUDDMq1R$lNTufHdtwCrLJFrZS6p5QtMwJRVkSB0ULRgoIKzmXoOEZqiCwMFFGqh6wCPWRhiA0wYkMfd8pRcD.5P6PQ8ou1 --iscrypted
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
gcc
make
perl
kernel-devel
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

mkdir /home/vagrant/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys

sed -i -r -e 's/^(%wheel)/# \1/' -e 's/^#\s*(%wheel.+NOPASSWD)/\1/' -e 's/^(Defaults\s+requiretty)/# \1/' /etc/sudoers
rm /etc/sudoers.bak
restorecon -r /home
%end
