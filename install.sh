mount /dev/sr0 /mnt
cd /etc/yum.repos.d/
#mkdir bak
#mv openEuler.repo bak

touch openeuler.repo
echo "[file]" >> openeuler.repo
echo "name=iso" >> openeuler.repo
echo "baserurl=file:///mnt/" >> openeuler.repo
echo "enabled=1" >> openeuler.repo
echo "gpgcheck=0" >> openeuler.repo


yum makecache
yum install vim
yum install httpd
#systemctl status httpd
systemctl start httpd
#systemctl status httpd
ss -antip

systemctl status firewalld
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
