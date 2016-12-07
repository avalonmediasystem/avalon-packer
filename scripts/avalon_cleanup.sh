echo 'Disabling remote login for root...'
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'Removing installation cruft...'
yum clean all
#echo 'Resetting network configuration'
echo -n '' > /etc/udev/rules.d/70-persistent-net.rules
echo 'Zeroing empty disk space...'
cat /dev/zero > /tmp/zero.fill || rm -f /tmp/zero.fill
echo 'Prepping firstboot...'
# /usr/share/avalon-vm/dist-prep
echo 'Clearing command history...'
history -cw
