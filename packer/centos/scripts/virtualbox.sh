yum -y install perl binutils gcc make dkms kernel-devel-2.6.32-358.el6.x86_64 bzip2 kernel-headers-2.6.32-358.el6.x86_64
mkdir -p /mnt/virtualbox
mount -o loop /root/VBoxGuest*.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run
umount /mnt/virtualbox
rm -rf /root/VBoxGuest*.iso
