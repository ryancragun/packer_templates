# Vagrant specific
date > /etc/vagrant_box_build_time

# Add vagrant user
/usr/sbin/groupadd vagrant
/usr/sbin/useradd vagrant -g vagrant -G wheel
echo "vagrant" | /usr/bin/passwd --stdin vagrant
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Ssk 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' > /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome! Virtualize all the things' > /etc/motd
