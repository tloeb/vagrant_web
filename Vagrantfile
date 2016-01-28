
$init = <<END
	sudo yum install -y vim
	
	#SUDO Puppet
	sudo grep secure_path /etc/sudoers \
	 | sed -e 's#$#:/opt/puppetlabs/bin#' \
	 | sudo tee /etc/sudoers.d/puppet-securepath
	
	#COPY STATIC HTML
	sudo mkdir -p /var/www/testlab
	sudo cp /vagrant/static/index.html /var/www/testlab

	#Install Webbrowser
	sudo yum install -y lynx

	#Install NGINX Module
	sudo puppet module install jfryman-nginx

	#Apply NGINX Manifest
	sudo puppet apply /vagrant/manifests/nginx.pp
	
	# Firewall Settings for NGINX
	sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
END

Vagrant.configure("2") do |config|
	
	# use centos-6.6
	config.vm.box = "puppetlabs/centos-6.6-32-puppet"
	config.vm.network :forwarded_port, host: 5000, guest: 80

	#Virtual Box Settings
	config.vm.provider :virtualbox do |vb|
	  
	end

	
	config.vm.define "webserver", primary:true do |webserver|
	  webserver.vm.hostname="web-serv"
	  webserver.vm.provision "shell", inline: $init
	end
end
