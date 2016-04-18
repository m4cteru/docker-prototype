# -*- mode: ruby -*-
# vi: set ft=ruby :

$install_tools = <<SCRIPT
  # tools
  apt-get update
  apt-get install -y git tmux vim curl

  # docker compose
  curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  service docker stop
  service docker start
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "padrino-sample"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest:   80, host_ip: "127.0.0.1", protocol: 'tcp', host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest:  443, host_ip: "127.0.0.1", protocol: 'tcp', host: 4443, auto_correct: true
  config.vm.network "forwarded_port", guest: 3306, host_ip: "127.0.0.1", protocol: 'tcp', host: 3306, auto_correct: true

  config.vm.provision "docker"
  config.vm.provision "shell", inline: $install_tools

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  
    vb.memory = "2024"
    vb.cpus   = "2"
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end
