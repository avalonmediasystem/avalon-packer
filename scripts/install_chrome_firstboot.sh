#Install google chrome on reboot
yum -y install google-chrome-stable
/bin/cat /etc/crontab | /bin/grep -v firstboot > /etc/crontab.tmp
/bin/rm -f /etc/crontab
/bin/mv /etc/crontab.tmp /etc/crontab
rm -f $0
