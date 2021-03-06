# Installing the virtualbox guest additions
yum install -y kernel-devel-`uname -r` make gcc-c++
VBOX_VERSION=$(cat /home/packer/.vbox_version)
cd /tmp
mount -o loop /home/packer/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/packer/VBoxGuestAdditions_*.iso
