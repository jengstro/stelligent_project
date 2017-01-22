package { "nginx":
      ensure => installed
}

service { "nginx":
      require => Package["nginx"],
      ensure  => running,
      enable  => true
}

file { "/usr/share/nginx/html/index.html":
    ensure  => "file",
    require => Package[nginx],
    content => "<!DOCTYPE html>
        <html><body>
        Automation For The People.
        "
}
