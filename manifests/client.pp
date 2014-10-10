package { 'mcollective':
  ensure => present,
  allow_virtual => false,
}

package { 'puppet':
  ensure => present,
  allow_virtual => false,
}

service { 'mcollective':
  require => Package['mcollective'],
  ensure => running,
  enable => true,
}

service { 'puppet':
  require => Package['puppet'],
  ensure => running,
  enable => true,
}

file {'/etc/puppet/puppet.conf':
  ensure => present,
  source => "puppet:///modules/puppet/client.conf",
  notify => Service['puppet'],
}

file { '/etc/mcollective/server.cfg':
  ensure => present,
  source => "puppet:///modules/mcollective/server.cfg",
  notify => Service['mcollective'],
  require => Package['mcollective'],
}
