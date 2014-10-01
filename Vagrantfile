Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"
  config.vm.provision "shell", inline: "yum install -y puppet"

  # base box
  config.vm.box = "cent-6.5-base"

  config.ssh.private_key_path = "~/.ssh/nathanpowell.org-vagrant_rsa"

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
