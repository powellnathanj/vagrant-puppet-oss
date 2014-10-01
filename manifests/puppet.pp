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
  require => Package['puppet'],
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
  ensure => running,
  enable => true,
}
