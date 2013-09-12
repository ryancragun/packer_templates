# import key
curl -Ss 'https://s3.amazonaws.com/rightscale_key_pub/rightscale_key.pub' > /etc/pki/rpm-gpg/RPM-GPG-KEY-rightscale
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-rightscale
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rightscale

# add RightScale-epel repo
cat >/etc/yum.repos.d/RightScale-epel.repo<<-'EOF'
[rightscale-epel]
name=RightScale Software
baseurl=http://cf-mirror.rightscale.com/rightscale_software/epel/6/x86_64/archive/latest/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rightscale
EOF

# add Rightlink-Beta repo
cat >/etc/yum.repos.d/RightLink-Beta.repo<<-'EOF'
[rightlink]
name=RightScale RightLink Beta
baseurl=https://rightlink-staging.s3.amazonaws.com/yum/1/el/6/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rightscale
EOF

yum install -y --skip-broken rightimage-extras
yum install -y rightlink-cloud-none
