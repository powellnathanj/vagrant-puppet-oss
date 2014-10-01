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
