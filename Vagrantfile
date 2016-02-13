# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.insert_key = false
  config.landrush.enabled = true
  config.landrush.tld = 'sesame'

  config.vm.define "client1" do |client|
    # Ubuntu 12.04
    client.vm.box = "ubuntu/precise64"
    client.vm.hostname = "client1.#{config.landrush.tld}"

  end
  
  config.vm.define "client2" do |client|
    # Ubuntu 14.04
    client.vm.box = "ubuntu/trusty64"
    client.vm.hostname = "client2.#{config.landrush.tld}"

  end
  
  config.vm.define "client3" do |client|
    # Ubuntu 16.04 BETA
    client.vm.box = "ubuntu/wily64"
    client.vm.hostname = "client3.#{config.landrush.tld}"

  end
  
  
  config.vm.define "aptcacheng1" do |aptcacheng|
    aptcacheng.vm.box = "ubuntu/trusty64"
    aptcacheng.vm.hostname = "aptcacheng1.#{config.landrush.tld}"

    aptcacheng.vm.provision "ansible" do |ansible|
      ansible.limit = "all"
      ansible.playbook = "site.yml"
      ansible.verbose = true
      ansible.groups = {
        "aptcacheng" => ["aptcacheng1"],
        "client" => ["client1", "client2", "client3"]
      }
    end

  end

end
