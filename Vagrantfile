
Vagrant.configure("2") do |config|
    servers=[
        {
          :hostname => "control",
          :box => "bento/ubuntu-18.04",
          :ip => "192.168.211.51",
          :ssh_port => '2200'
        },
        {
          :hostname => "node1",
          :box => "bento/ubuntu-18.04",
          :ip => "192.168.211.52",
          :ssh_port => '2201'
        },
        {
          :hostname => "node2",
          :box => "bento/ubuntu-18.04",
          :ip => "192.168.211.53",
          :ssh_port => '2202'
        },
        {
          :hostname => "node3",
          :box => "bento/ubuntu-18.04",
          :ip => "192.168.211.54",
          :ssh_port => '2203'
        }
      ]

    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network :private_network, ip: machine[:ip]
            #node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
            node.vm.network :forwarded_port, host: 22, guest: 22, protocol: "tcp"
            node.vm.network :forwarded_port, host: 80, guest: 80, protocol: "tcp"
            node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--memory", 512]
                vb.customize ["modifyvm", :id, "--cpus", 1]
        config.vm.synced_folder "./data", "/home/vagrant/data" #we can easily syncronise our files
        config.vm.network "forwarded_port", guest: 22, host: 22, protocol: "tcp"
        config.vm.network "forwarded_port", guest: 80, host: 80, protocol: "tcp"
        # config.ssh.username = 'root'
        # config.ssh.password = 'vagrant'
        #config.ssh.insert_key = 'true'     
        config.vm.provision "ansible" do |ansible|
          ansible.verbose = "v"
          ansible.playbook = "playbook1.yml"
        end
        end
        end
    end
end