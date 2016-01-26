class { 'nginx':}

nginx::resource::vhost { '127.0.0.1':
		www_root => '/var/www/testlab'
	}