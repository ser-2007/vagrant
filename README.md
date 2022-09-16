# vagrant


# First we must install the vagrant to our local machine
# Install Vagrant
https://www.vagrantup.com/docs/installation


After that we install Oracle Virtual Box


# Install Oracle Virtualbox

https://www.vagrantup.com/docs/providers/virtualbox




# We write a Vagrantfile. And we write an sh file. In install.sh file there some commands which install and configure docker to the vm.
And in vagrant file I create two virtual machines, one of them is control node and the other is node1, Because we will use ansible in the future I think maybe we need the second one

```
We give the Vagrantfile as a name to the file.

Vagrantfile

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
      ]

    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
       # config.vm.hostname = "Docker"
            node.vm.box = "bento/ubuntu-18.04"
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network :private_network, ip: machine[:ip]
            node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"  
            node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--memory", 1024]
                vb.customize ["modifyvm", :id, "--cpus", 2]
        config.vm.provision "shell", path: "./install.sh"                
            end
        end
    end
end

```

# And after writing this file, we open the folder with code . 

And than 
vagrant up
 # In the beginning there were some problems, I took some error and I add the path of PowerShell to the PATH environment variable. After that it works
```

PATH="${PATH}:/c/Windows/System32/WindowsPowerShell/v1.0"
export PATH="$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
```

### vagrant ssh control and vagrant ssh node1

I connect to the control node with ssh connection with "vagrant ssh control" command

And check the docker is installed. 
docker version
" Version:           20.10.18"

```



### Docker,  Python-flask app control

### Test Docker
Log into node1 and test to make sure docker is working.

```
docker run hello-world
```
```

