class subversion::configure {
  $subversion_directory         = $subversion::subversion_directory
  $subversion_project_directory = $subversion::subversion_project_directory
  $project_name                 = $subversion::project_name
  $subversion_tree              = $subversion::params::subversion_tree


  file { $subversion_directory:
    ensure => directory,
    path   => $subversion_directory,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0664',
  }
  file { $subversion_project_directory:
    ensure => directory,
    path   => $subversion_project_directory,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0664',
  }
  exec { 'svnadmin create':
    command  => "svnadmin create ${subversion_project_directory}/${project_name}",
    provider => shell,
    unless   => "ls ${subversion_project_directory}/${project_name}",
  }
  file { $subversion_tree:
    ensure => directory,
    owner  => 'root',
    group  => 'wheel',
    mode   => '0750',
  }

  file { "${subversion_project_directory}/${project_name}":
    path    => "${subversion_project_directory}/${project_name}",
    owner   => 'apache',
    group   => 'apache',
    mode    => '0664',
    recurse => true,
  }
}
