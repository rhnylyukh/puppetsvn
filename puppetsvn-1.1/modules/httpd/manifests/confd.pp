define httpd::confd (
  $subversion_project_directory,
  $project_name,
  $httpd_port,
  $directory,
) {

  file { "/etc/httpd/conf.d/${name}":
    ensure  => file,
    content => template("profile/${name}.erb"),
    owner   => 'apache',
    group   => 'apache',
    mode    => '0664',
  }
}