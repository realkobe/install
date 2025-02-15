#nmcli c show
ens=$(nmcli c show | awk 'NR==2{print $4}')
#read -p "Enter ens:" ens
echo $ens --------------------
#nmcli c edit $ens
#goto ipv4
read -p "Enter ip:" ip
#set addresses $ip
#save
read -p "Enter gateway:" gateway
#set gateway $gateway
#save
#back
#goto connection
#set autoconnect yes
#save
#quit
sed -i '$a IPADDR='$ip /etc/sysconfig/network-scripts/ifcfg-$ens
sed -i '$a PREFIX=24' /etc/sysconfig/network-scripts/ifcfg-$ens
sed -i '$a GATEWAY='$gateway /etc/sysconfig/network-scripts/ifcfg-$ens
sed -i '$a DNS1=119.29.29.29' /etc/sysconfig/network-scripts/ifcfg-$ens
#sed -i 's/IPADDR.*/IPADDR='$ip'/g' /etc/sysconfig/network-scripts/ifcfg-$ens
#sed -i 's/PREFIX.*/PREFIX=24/g' /etc/sysconfig/network-scripts/ifcfg-$ens
#sed -i 's/GATEWAY.*/GATEWAY='$gateway'/g' /etc/sysconfig/network-scripts/ifcfg-$ens
#sed -i 's/DNS1.*/DNS1=119.29.29.29/g' /etc/sysconfig/network-scripts/ifcfg-$ens
sed -i 's/ONBOOT.*/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-$ens
sed -i 's/BOOTPROTO.*/BOOTPROTO=none/g' /etc/sysconfig/network-scripts/ifcfg-$ens
cat /etc/sysconfig/network-scripts/ifcfg-$ens

echo ip add show--------------
ip add show
#ifdown $ens
#ifup $ens
echo systemctl restart NetworkManager---------------------
systemctl restart NetworkManager
echo nmcli d reapply $ens -------------------
nmcli d reapply $ens

echo mount /dev/sr0 /mnt-----------------
mount /dev/sr0 /mnt
echo cd /etc/yum.repos.d/---------------------
cd /etc/yum.repos.d/
echo mkdir bak-----------------------
mkdir bak
echo mv openEuler.repo bak-------------------------
mv openEuler.repo bak

echo touch openEuler.repo-----------------------
touch openEuler.repo
echo "[file]" >> openEuler.repo
echo "name=iso" >> openEuler.repo
echo "baseurl=file:///mnt/" >> openEuler.repo
echo "enabled=1" >> openEuler.repo
echo "gpgcheck=0" >> openEuler.repo
cat openEuler.repo

echo yum makecache----------------------
yum makecache
echo yum install vim------------------------
yum install vim
echo yum install httpd----------------------
yum install httpd
#systemctl status httpd
echo systemctl start httpd----------------------
systemctl start httpd
echo systemctl enable httpd----------------------
systemctl enable httpd
#systemctl status httpd
echo ss -antip--------------------
ss -antip

echo systemctl status firewalld--------------------------
systemctl status firewalld
echo firewall-cmd --permanent --add-port=80/tcp----------------------------
firewall-cmd --permanent --add-port=80/tcp
echo firewall-cmd --reload------------------------------
firewall-cmd --reload
