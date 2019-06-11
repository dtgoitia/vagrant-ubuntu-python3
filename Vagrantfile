# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1904"
  config.vm.provision :shell, path: "bootstrap.sh"

  # Sync folders:
  #   - Host: ./abot/
  #   - Guest: ./projects/abot/
  # config.vm.synced_folder "./abot/", "/home/vagrant/projects/abot"

  # To fix error:
  # [default] GuestAdditions seems to be installed (6.0.8) correctly, but not running.
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false  
  end
end
