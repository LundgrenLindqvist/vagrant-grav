# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder ".", "/vagrant", :owner => "www-data"

  # Uncomment the following line and change the first path to the path of your
  # development theme
  # config.vm.synced_folder "/home/example/development/my-grav-theme", "/vagrant/grav-admin/user/themes/example", :owner => "www-data"

  # Setup virtual hostname and provision local IP
  config.vm.hostname = "grav.dev"
  config.vm.network :private_network, :ip => "192.168.33.10"
  config.hostsupdater.aliases = %w{www.grav.dev}
  config.hostsupdater.remove_on_suspend = true

  # Allows running commands globally in shell for installed composer libraries
  config.vm.provision :shell, path: "files/scripts/install-puppet.sh"

  config.vm.provision :puppet do |puppet|
    puppet.environment = "production"
    puppet.environment_path = "../../"

    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "init.pp"
    # puppet.options = "--verbose --debug"
  end

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
  end
end
