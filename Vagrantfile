# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # The path to the Berksfile to use. The default value is "Berksfile" if one
  # exists, or nil if it does not.
  #config.berkshelf.berksfile_path = "custom.Berksfile"

  # Enable Berkshelf. If a Berksfile exists or a berksfile_path is given, this
  # value is automatically set to true. If not, the value is false
  config.berkshelf.enabled = true

  # A list of Berkshelf groups to only install and sync to the Vagrant Virtual
  # Machine. The default value is an empty array.
  #config.berkshelf.only = ["group_a", "group_b"]

  # A list of Berkshelf groups to not install and sync to the Vagrant Virtual
  # Machine. The default value is an empty array.
  #config.berkshelf.except = ["group_c", "group_d"]

  # A list of extra values to pass to the `berks` executable. The default value
  # is an empty array.
  #config.berkshelf.args = ["--format json"]

  # Configure whicc version of Chef to use.
  config.omnibus.chef_version = "11.10"

  config.vm.provision :chef_solo do |chef|
        # This recipe runs apt-get update for you
        chef.add_recipe "apt"
        # This recipe installs nginx
        chef.add_recipe "nginx"
        # This recipe installs postgresql
        chef.add_recipe "postgresql::server"
        chef.add_recipe "mnemonic::default"
        chef.json = { 
            :postgresql => {
                :enable_pgdg_apt => true,
                :password => { :postgres =>  "md5b3f502afeed93efd0a2798b259f2cfdc" }
            }
        }
        #chef.add_role "web"
  end
end
