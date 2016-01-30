# -*- mode: ruby -*-
# vi: set ft=ruby :

# Set the Ansible configuration environment variable
ENV['ANSIBLE_CONFIG'] = "./tests/ansible.cfg"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "ansible" do |ansible|

    # Playbook used to test role
    ansible.playbook  = "tests/test_vagrant.yml"
    ansible.verbose = "v"

  end

end

