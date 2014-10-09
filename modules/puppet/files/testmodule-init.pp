class testmodule {
  file { "/var/tmp/itsworking":
    content => "It worked\n",
  }
}
