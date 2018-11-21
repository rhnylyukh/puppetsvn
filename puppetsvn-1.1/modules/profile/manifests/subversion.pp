class profile::subversion {

  $subversion_directory         = '/var/www/svn'
  $subversion_project_directory = '/var/www/svn/projects'
  $project_name                 = lookup('profile::subversion::project_name')
  $httpd_port                   = lookup('profile::subversion::httpd_port')
  $newrep_users                 = lookup('profile::subversion::newrep_users')


  contain '::httpd'
  contain '::subversion'
  contain '::httpd::service'

  httpd::confd {'subversion.conf':
    directory                    => $subversion_directory,
    subversion_project_directory => $subversion_project_directory,
    project_name                 => $project_name,
    httpd_port                   => $httpd_port,
    before                       => Class['::httpd::service'],
}

  file { "${subversion_project_directory}/${project_name}/newrep.users":
    content => $newrep_users,
    owner   => 'apache',
    group   => 'apache',
    mode    => '0664',
    require => Class['::httpd'],
  }

  Class['::httpd']
  -> Class['::subversion']
  -> Class['::httpd::service']


  exec { 'svn_import':
    command  => "svn import -m 'Initializing_basic_repository_tree' /tmp/svn/ http://localhost/svn/${project_name} --non-interactive --username rhnyl --password rhnyl",
    provider => shell,
    require  => File['/etc/httpd/conf.d/subversion.conf'],
  }
}
