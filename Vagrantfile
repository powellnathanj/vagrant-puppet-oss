Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"
  config.vm.provision "shell", inline: "yum install -y puppet"

  # base box
  config.vm.box = "cent-6.5-base"

  config.ssh.private_key_path = "~/.ssh/nathanpowell.org-vagrant_rsa"

  config.vm.define "puppet", primary: true do |puppet|
    config.vm.hostname = "puppet"
    config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "master.pp"
    end
  end

  config.vm.define "client" do |client|
    config.vm.hostname = "client"
    config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "client.pp"
    end
  end

end
