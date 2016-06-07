echo 'Installing firstboot and distribution tools...'
yum install -y firstboot perl-XML-Twig perl-YAML-LibYAML anaconda-gui initial-setup-gui
rpm -i 'http://www.avalonmediasystem.org/downloads/avalon-vm-2.2-5.noarch.rpm'
echo 'Removing installation cruft...'
rm -rf /root/Downloads/* /var/avalon/dropbox/* /opt/staging /root/avalon-installer-flat /root/flat.tar.gz
echo 'Removing guest additions'
/opt/VBoxGuestAdditions*/uninstall.sh
yum clean all
echo 'Resetting network configuration'
echo -n '' > /etc/udev/rules.d/70-persistent-net.rules
echo 'Zeroing empty disk space...'
#cat /dev/zero > /tmp/zero.fill || rm -f /tmp/zero.fill
echo 'Deleting vagrant user...'
/usr/sbin/userdel -rf vagrant
echo 'Prepping firstboot...'
/usr/share/avalon-vm/dist-prep
echo 'Clearing command history...'
history -cw
