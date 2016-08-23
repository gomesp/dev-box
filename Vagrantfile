# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

servers = YAML.load_file('servers.yaml')

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://bit.datacom.co.nz:3128"
    config.proxy.https    = "http://bit.datacom.co.nz:3128"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  servers.each do |opts|
    config.vm.define opts["servername"] do |config|
      config.vm.box = opts["box"]
      config.vm.hostname = opts["hostname"]
      config.vm.network :private_network, ip: opts["eth1"]
      config.vm.provision "puppet"

      config.vm.provider "virtualbox" do |v|
        v.name = opts["servername"]
        v.customize ["modifyvm", :id, "--memory", opts["mem"]]
        v.customize ["modifyvm", :id, "--cpus", opts["cpu"]]
      end
    end
  end
end
