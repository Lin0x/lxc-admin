VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.6"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provision :shell, path: "_vagrant/apt.sh", privileged: true
  config.vm.provision :shell, path: "_vagrant/rvm.sh", privileged: false
end
