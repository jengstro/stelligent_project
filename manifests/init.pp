class nginx {
  package { 'nginx':
    ensure => present,
  }
  file { "/usr/share/nginx/html/index.html":
    ensure  => "file",
    require => Package[nginx],
    content => "<!DOCTYPE html>
    <html><body>
    Automation For The People.
    "
  }
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
