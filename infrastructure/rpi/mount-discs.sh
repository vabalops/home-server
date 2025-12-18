## Mount additional disc for Longhorn

# list disks
lsblk -f

# to partition disk
# d o n w
sudo fdisk /dev/sda

# format disk
sudo mkfs -t ext4 /dev/sdb1

# mount disk
sudo mkdir -p /var/lib/longhorn
sudo mount -t auto /dev/sdb1 /var/lib/longhorn

# to ensure the disk automatically mounts when your Linux system boots, you need to add it to /etc/fstab

# list partition ids
blkid
# or list if not visible with blkid
ls -l /dev/disk/by-partuuid/

# to check if disk identifier is correct
sudo fdisk -l /dev/sdb

# edit fstab file
# PARTUUID=de8ce8a2-01 /var/lib/longhorn ext4 defaults 0 2
sudo vim /etc/fstab

