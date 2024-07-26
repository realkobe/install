mount /dev/sr0 /mnt
cd /etc/yum.repos.d/
mkdir bak
mv openEuler.repo bak

touch openEuler.repo
echo "[file]" >> openEuler.repo
echo "name=iso" >> openEuler.repo
echo "baserurl=file:///mnt/" >> openEuler.repo
echo "enabled=1" >> openEuler.repo
echo "gpgcheck=0" >> openEuler.repo


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
