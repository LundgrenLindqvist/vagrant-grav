exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ] }

class { 'nginx::install': }
class { 'php7::install': }
class { 'grav::install': }
