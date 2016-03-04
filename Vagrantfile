# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "puppet-restful-demo"
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    cp /vagrant/bootstrap/puppetlabs-pc1.list /etc/apt/sources.list.d
    cp /vagrant/bootstrap/puppetlabs-pc1-keyring.gpg /etc/apt/trusted.gpg.d
    apt-get update
    apt-get -y install language-pack-en puppet-agent
    /opt/puppetlabs/puppet/bin/puppet module install jay/nodejs
    /opt/puppetlabs/puppet/bin/puppet module install proletaryo/supervisor
    if [[ -d /vagrant/modules/restful ]]
    then
        ln -s /vagrant/modules/restful /etc/puppetlabs/code/environments/production/modules/restful
    else
        git clone https://github.com/dougneal/puppet-restful.git /etc/puppetlabs/code/environments/production/modules/restful
    fi
    /opt/puppetlabs/puppet/bin/puppet apply /vagrant/manifests/setup_restful_api.pp
  SHELL

end
