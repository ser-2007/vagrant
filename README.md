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

```

# And after writing this file, we open the folder with code . 

And than 
vagrant up
 # In the beginning there were some problems, I took some error and I add the path of PowerShell to the PATH environment variable. After that it works. 
```

PATH="${PATH}:/c/Windows/System32/WindowsPowerShell/v1.0"
export PATH="$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
```

### vagrant ssh control

I connect to the control node with ssh connection with "vagrant ssh control" command

And I checked the docker is installed. 
docker version
" Version:           20.10.18"

```


```

# Make hosts SSH accessible
```
ssh-keygen
ssh-copy-id node1 && ssh-copy-id node2 && ssh-copy-id node3



# sudo apt update

# Install Ansible on control station
```
sudo apt-get install ansible -y
```


```


### Test ansible
```
ansible nodes  -m command -a hostname
```
It works
node2 | SUCCESS | rc=0 >>
control

node1 | SUCCESS | rc=0 >>
control

node3 | SUCCESS | rc=0 >>
control

After taking ssh-connect plroblems, first;
I make port-forwarding on VM 22 to 22

and on the other hand when I try to connect to for ex. node1 with ssh it wants password but it doesnot accept what I write,
After that I add to VAgrantfile:
config.ssh.username = 'root'
config.ssh.password = 'vagrant'
config.ssh.insert_key = 'true'

and then, I 
use vagrant provision command to update my vagrant.

and after that I could reach to the node1 from control with ssh



### Run the playbook 
```
ansible-playbook playbook1.yml
`
With this playbook;
we install docker, docker-compose to our vm, and aftere that in the same playbook we copy our files to the host and we use compose-up command and after that
it triggers the actions and it run the Docker file and it runs the bookstore.py and in this py file there are some http methods .


To showcase  REST functions, use `curl` command for each HTTP methods namely, `GET`, `POST`, `PUT`, `DELETE`.

Some of them I used : 
curl 127.0.0.1/books
{"books":[{"author":"Delia Owens","book_id":1,"is_sold":true,"title":"Where the Crawdads Sing"},{"author":"Brit Bennett","book_id":2,"is_sold":false,"title":"The Vanishing Half: A Novel"},{"author":"James Patterson, Chris Tebbetts","book_id":3,"is_sold":false,"title":"1st Case"}]} 

 curl -H "Content-Type: application/json" -X PUT -d '{"author":"Franz Kafka","title":"Dava"}' 127.0.0.1/books/3

 and  " {"updated book":{"author":"Franz Kafka","book_id":3,"is_sold":false,"title":"Dava"}}"

curl -H "Content-Type: application/json" -X POST -d '{"author":"Paulo Coelho","title":"The Alchemist"}' 127.0.0.1/books

{"newly added book":{"author":"Paulo Coelho","book_id":4,"is_sold":false,"title":"The Alchemist"}}
 
 And the last steps:
 I ll push my task to the github project

 I create new branches
 I checkout to the newbranch and I made some works in differenr branchs
 at the end of this task I pull-request and merge branches to the main branch


