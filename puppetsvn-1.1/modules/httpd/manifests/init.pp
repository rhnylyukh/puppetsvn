class httpd (
  $httpd_port = $httpd::params::httpd_port,
) inherits httpd::params {

  contain '::httpd::install'
  contain '::httpd::configure'

  Class['::httpd::install']
  -> Class['::httpd::configure']


}