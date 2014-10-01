package { 'epel-release':
  ensure => 'present'
}

package { 'puppet-server':
  ensure => 'present',
}

package { 'mcollective-client':
  ensure => 'present',
}

package { 'activemq':
  ensure => 'present',
}

service {'puppet':
  ensure => running,
  enabled => true,
}

service {'puppet-server':
  ensure => running,
  enabled => true,
}

service {'mcollective':
  ensure => running,
  enabled => true,
}
