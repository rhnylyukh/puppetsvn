class httpd::install {
  package { 'httpd':
    ensure   => installed,
    provider => 'yum',
  }
}
