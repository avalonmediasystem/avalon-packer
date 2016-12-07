#!/bin/bash
set -o errexit -o nounset

# https://docs.docker.com/engine/installation/debian/
echo "Installing Docker"
echo "------------------------------------"
echo
# yum update -y
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum install -y docker-engine
systemctl enable docker.service
systemctl start docker


echo
echo "Installing docker-compose"
echo "------------------------------------"
echo
curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose &&\
chmod +x /usr/local/bin/docker-compose
docker-compose --version
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
