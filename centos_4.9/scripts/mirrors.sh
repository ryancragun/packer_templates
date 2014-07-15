sed -i -e "s%#baseurl=http://mirror.centos.org/centos/\$releasever%baseurl=http://vault.centos.org/4.9%g" /etc/yum.repos.d/CentOS-Base.repo
sed -i -e "s/mirrorlist/#mirrorlist/g" /etc/yum.repos.d/CentOS-Base.repo
