# run with sudo
apt install nfs-common

mkdir /mnt/data

echo "# nfs mount" >> /etc/fstab
echo "192.168.1.54:/mnt/data /mnt/data nfs user,nofail,x-systemd.automount,x-systemd.requires=network-online.target,_netdev,x-systemd.idle-timeout=600 0 0" >> /etc/fstab
