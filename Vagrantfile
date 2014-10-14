Vagrant.configure("2") do |config|

  ## Set up proxy if there is one in the environment
  if ENV['http_proxy'] && ENV['https_proxy']
    htp = ENV['http_proxy']
    htps = ENV['https_proxy']
    config.vm.provision "shell", :inline => "echo export http_proxy=#{htp} >> ~/.bashrc"
    config.vm.provision "shell", :inline => "echo export https_proxy=#{htps} >> ~/.bashrc"
  end
  ## End proxy set up

  config.vm.provision "shell", inline: "source ~/.bashrc"
  config.vm.provision "shell", inline: "yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"
  config.vm.provision "shell", inline: "yum install -y puppet"

  # base box
  config.vm.box = "hershey-rhel6-65"

  #config.ssh.private_key_path = "~/.ssh/nathanpowell.org-vagrant_rsa"

  # Puppet master
  config.vm.define "puppet", primary: true do |puppet|
    puppet.vm.hostname = "puppet.nathanpowell.test"

    # Internal networking
    puppet.vm.network :private_network, :ip => '10.20.1.2'
    puppet.vm.provision :hosts do |provisioner|
      provisioner.autoconfigure = true
      provisioner.add_host '10.20.1.3', ['client.nathanpowell.test', "client"]
    end    

    puppet.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "puppet.pp"
    end
  end
 
  # Puppet client
  config.vm.define "client" do |client|
    client.vm.hostname = "client.nathanpowell.test"

    # Internal networking
    client.vm.network :private_network, :ip => '10.20.1.3'
    client.vm.provision :hosts

    client.vm.provision "puppet" do |cl|
      cl.module_path = "modules"
      cl.manifest_file = "client.pp"
    end
  end

end
