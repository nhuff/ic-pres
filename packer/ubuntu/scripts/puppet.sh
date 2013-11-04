wget -O /tmp/precise.deb http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i /tmp/precise.deb
apt-get -y update
apt-get -y install puppet
