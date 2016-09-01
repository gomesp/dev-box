#!/usr/bin/env bash
# this script installs the puppet modules we need,
#and tries to do tricks with setting local repository for ubuntu updates

# Install wget

sudo apt-get install -qy wget;

sed -e '/templatedir/ s/^#*/#/' -i.back /etc/puppet/puppet.conf

# Install Puppetlabs GPG key
if [[ ! -f '/.puphpet-stuff/puppetlabs-gpg' ]] && [[ "${OS}" == 'debian' || "${OS}" == 'ubuntu' ]]; then
    wget https://apt.puppetlabs.com/pubkey.gpg
    apt-key add pubkey.gpg

#    touch '/.puphpet-stuff/puppetlabs-gpg'
fi

## set local/fastest mirror and local timezone
mv /etc/apt/sources.list /etc/apt/sources.list.orig
cat > /etc/apt/sources.list <<EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOF
sudo apt-get update
export tz=`wget -qO - http://geoip.ubuntu.com/lookup | sed -n -e 's/.*<TimeZone>\(.*\)<\/TimeZone>.*/\1/p'` &&  sudo timedatectl set-timezone $tz

if [ ! -d /etc/puppet/modules ]; then
  mkdir -p /etc/puppet/modules;
fi
if [ ! -d /etc/puppet/modules/apt ]; then
 puppet module install puppetlabs-apt
fi
if [ ! -d /etc/puppet/modules/java ]; then
 puppet module install puppetlabs-java
fi
if [ ! -d /etc/puppet/modules/git ]; then
  puppet module install puppetlabs-git
fi

# Modules to install in the future:
# puppet module install puppetlabs-java_ks
