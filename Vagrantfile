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
  config.vm.box = "hershey-rhel6-64"

  #config.ssh.private_key_path = "~/.ssh/nathanpowell.org-vagrant_rsa"

  config.vm.define "master", primary: true do |master|
    master.vm.hostname = "puppet"
    master.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "puppet.pp"
    end
  end

  config.vm.define "client" do |client|
    client.vm.hostname = "client"
    client.vm.provision "puppet" do |cl|
      cl.manifest_file = "client.pp"
    end
  end

end
