class subversion::service {
  service { 'httpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }
}