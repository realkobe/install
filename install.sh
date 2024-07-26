mount /dev/sr0 /mnt
cd /etc/yum.repos.d/
#mkdir bak
#mv openEuler.repo bak

touch openeuler2.repo
echo "[file]" >> openeuler2.repo
echo "name=iso" >> openeuler2.repo
echo "baserurl=file:///mnt/" >> openeuler2.repo
echo "enabled=1" >> openeuler2.repo
echo "gpgcheck=0" >> openeuler2.repo


yum makecache
yum install vim
yum install httpd
#systemctl status httpd
systemctl start httpd
systemctl status httpd
ss -antip

systemctl status firewalld
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
