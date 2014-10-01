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
