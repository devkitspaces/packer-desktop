#!/bin/bash -eu
SSH_USER=${SSH_USERNAME:-vagrant}

apt-get install -y dkms

VBOX_VERSION=$(cat /home/${SSH_USER}/.vbox_version)
mount -o loop /home/${SSH_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm /home/${SSH_USER}/VBoxGuestAdditions_$VBOX_VERSION.iso
rm /home/${SSH_USER}/.vbox_version
rm /sbin/mount.vboxsf && ln -s /usr/lib/VBoxGuestAdditions/mount.vboxsf /sbin/mount.vboxsf