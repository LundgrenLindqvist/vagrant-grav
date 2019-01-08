# Install latest Grav

class grav::install {

  exec { 'download-grav':
    command => '/usr/bin/wget https://github.com/getgrav/grav/releases/download/1.1.3/grav-admin-v1.1.3.zip',
    cwd     => '/vagrant/',
    creates => '/vagrant/grav-admin-v1.1.3.zip'
  }

  package { 'unzip':
    ensure => present,
    notify => Exec['unzip-grav']
  }

  exec { 'unzip-grav':
    cwd     => '/vagrant/',
    user    => 'root',
    command => '/usr/bin/unzip /vagrant/grav-admin-v1.1.3.zip',
    require => Exec['download-grav'],
    creates => '/vagrant/grav-admin/index.php',
  }

}
