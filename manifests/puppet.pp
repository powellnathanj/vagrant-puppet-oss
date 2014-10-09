package { 'epel-release':
  ensure => 'present',
  allow_virtual => false,
}

package { 'puppet-server':
  ensure => 'present',
  allow_virtual => false,
}

package { 'puppet':
  ensure => 'present',
  allow_virtual => false,
}

package { 'mcollective-client':
  ensure => 'present',
  allow_virtual => false,
}

package { 'activemq':
  ensure => 'present',
  allow_virtual => false,
}

service {'puppet':
  require => [Package['puppet'], File['/etc/puppet/puppet.conf']],
  ensure => running,
  enable => true,
}

service {'puppetmaster':
  require => Package['puppet-server'],
  ensure => running,
  enable => true,
}

service {'activemq':
  require => Package['activemq'],
  hasstatus => false,
  ensure => running,
  enable => true,
}

file {'/etc/puppet/puppet.conf':
  ensure => present,
  source => "puppet:///modules/puppet/puppet.conf",
  notify => [Service['puppet'], Service['puppetmaster']],
}

file { '/etc/puppet/manifests/site.pp':
  ensure => present,
  source => "puppet:///modules/puppet/site.pp",
}

file { ['/etc/puppet/modules/testmodule', 
  '/etc/puppet/modules/testmodule/manifests']:
  ensure => directory,
}

file { '/etc/puppet/modules/testmodule/manifests/init.pp':
  ensure => present,
  source => "puppet:///modules/puppet/testmodule-init.pp",
}

#file {'/etc/mcollective/server.cfg':
#  ensure => present,
#  source => "puppet:///modules/mcollective/server.cfg",
#}
