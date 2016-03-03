# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    if [[ -f /usr/bin/puppet ]]
    then
      apt-get -y purge puppet puppet-common
      wget http://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
      dpkg -i puppetlabs-release-pc1-trusty.deb
      apt-get update
      apt-get -y install puppet-agent
    fi
    
    if [[ ! -f /usr/bin/npm ]]
    then
      apt-get -y install npm nodejs-legacy
    fi

    npm install -g json-server

  SHELL

end
