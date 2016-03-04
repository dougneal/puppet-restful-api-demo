class { '::nodejs' :
  manage_package_repo       => false,
  nodejs_dev_package_ensure => absent,
  npm_package_ensure        => 'installed',
}

package { 'nodejs-legacy' :
  ensure  => installed,
  require => Class['::nodejs'],
}

package { 'json-server' :
  ensure   => present,
  provider => 'npm',
  require  => Class['::nodejs'],
}

supervisor::program { 'muppet-server' :
  ensure         => present,
  enable         => true,
  command        => '/usr/local/bin/json-server /vagrant/data/muppets.json',
  directory      => '/vagrant/data',
  user           => 'vagrant',
  group          => 'vagrant',
  stdout_logfile => 'muppet-server.stdout.log',
  stderr_logfile => 'muppet-server.stderr.log',
  environment    => 'HOME="/home/vagrant",USER=vagrant',
  require        => [
    Package['nodejs-legacy'],
    Package['json-server'],
  ]
}

