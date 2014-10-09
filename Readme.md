# This is my OSS Puppet/MCollective development environment.

You should be able to use it as well. You'll have to change the base box setting in the Vagrantfile, but otherwise it should just work.

It is almost certainly Virtualbox centric, but give it a try.

# Set up

This is a two node configuration. Node 1 is the puppetmaster, hostname puppet, and the second is a regular puppet server, hostname client.

Both nodes are defined in site.pp and are importing a test module that just writes out a file, so you know it's working.

# MCollective

Mcollective is on there as well and should be configured to work.  Have a look at the server.cgf and client.cfg for details.

