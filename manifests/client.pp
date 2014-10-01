package { 'mcollective':
  ensure => present,
}

service { 'mcollective':
  ensure => running,
  enabled => true,
}

service { 'puppet':
  ensure => running,
  enabled => true,
}
