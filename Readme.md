# This is my OSS Puppet/MCollective development environment.

You should be able to use it as well. You'll have to change the base box setting in the Vagrantfile, but otherwise it should just work.

# Set up

This is a two node configuration. Node 1 is the puppetmaster, hostname puppet, and the second is a regular puppet server, hostname client.

Both nodes are defined in site.pp and are importing a test module that just writes out a file, so you know it's working.

# MCollective

Mcollective is on there as well and should be configured to work.  Have a look at the server.cgf and client.cfg for details.

# Usage

## Quick start

`git clone https://github.com/slaney/vagrant-puppet-oss.git`

`cd vagrant-puppet-oss`

`vagrant up`

`vagrant ssh puppet`

```[vagrant@puppet ~]$ sudo puppet agent -t
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for puppet.nathanpowell.test
Info: Applying configuration version '1412964713'
Notice: Finished catalog run in 0.02 seconds```

```[vagrant@puppet ~]$ sudo mco find
puppet.nathanpowell.test
client.nathanpowell.test```

## Prerequisites

Virtualbox (might work with other providers)

vagrant-hosts (https://github.com/adrienthebo/vagrant-hosts)
