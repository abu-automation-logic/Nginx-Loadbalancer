Vagrant.configure("2") do |config|
  config.vm.define "load_balancer", primary: true do |load_balancer|
    load_balancer.vm.box = "ubuntu/bionic64"
 #   load_balancer.vm.network "private_network", type: "dhcp"
    load_balancer.vm.network :private_network, ip: "10.11.12.60"     
	load_balancer.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/nginx.yml"
      ansible.verbose           = true
      ansible.install           = true
    end
    load_balancer.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/sudoers.yml"
	  ansible.verbose           = true
	  ansible.install           = true
    end
	load_balancer.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/loadbalancer.yml"
      ansible.verbose           = true
      ansible.install           = true
    end
	load_balancer.vm.provision "shell", path: "files/check_nginx.sh"
  end
  config.vm.define "web_server1", primary: true do |web_server1|
    web_server1.vm.box = "ubuntu/bionic64"
    web_server1.vm.network "private_network", ip: "10.11.12.61"
	web_server1.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/nginx.yml"
      ansible.verbose           = true
      ansible.install           = true
    end
    web_server1.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/web_server1.yml"
	  ansible.verbose           = true
	  ansible.install           = true
    end
      web_server1.vm.provision "shell", path: "files/check_nginx.sh"
  end
  config.vm.define "web_server2", primary: true do |web_server2|
    web_server2.vm.box = "ubuntu/bionic64"
    web_server2.vm.network "private_network", ip: "10.11.12.62"
	web_server2.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/nginx.yml"
      ansible.verbose           = true
      ansible.install           = true
    end
    web_server2.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "ansible/playbooks/web_server2.yml"
	  ansible.verbose           = true
	  ansible.install           = true
    end
      web_server2.vm.provision "shell", path: "files/check_nginx.sh"
  end
end