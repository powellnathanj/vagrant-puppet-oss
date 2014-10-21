class mcollective {

  service{"mcollective":
    ensure => true,
    enable => true,
  }

  file{"/usr/libexec/mcollective/mcollective/agent/yum.rb":
    ensure => present,
    source => "puppet:///modules/mcollective/mcollective-yum-agent/agent/yum.rb",
    notify => Service['mcollective'],
  }

  file{"/usr/libexec/mcollective/mcollective/agent/yum.ddl":
    ensure => present,
    source => "puppet:///modules/mcollective/mcollective-yum-agent/agent/yum.ddl",
    notify => Service['mcollective'],
  }


}
