package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}