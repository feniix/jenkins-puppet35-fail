# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "spantree/ubuntu-precise-64"

  config.vm.synced_folder '.', '/usr/local/src/project', :create => 'true'
  config.vm.synced_folder 'puppet', '/usr/local/etc/puppet', :create => 'true'
  config.vm.hostname = 'default'
  config.vm.network :forwarded_port, host: 8080, guest: 8080

  config.vm.provision :shell, :path => 'shell/update-puppet.sh', :args => '/vagrant/shell'
  config.vm.provision :shell, :path => 'shell/librarian-puppet-vagrant.sh', :args => '/vagrant/shell'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.options = [
      '--verbose',
      '--debug',
      '--modulepath=/etc/puppet/modules:/usr/local/etc/puppet/modules',
      '--parser future'
    ]
  end
end
