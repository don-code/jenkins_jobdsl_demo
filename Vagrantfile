Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.7_chef-provisionerless.box"

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8081, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "jenkins_jobdsl_demo"
    chef.cookbooks_path = "berks-cookbooks"
  end
end
