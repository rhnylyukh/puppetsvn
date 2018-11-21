class subversion::install {
  $subversion_package = $subversion::subversion_package
  package { $subversion_package:
    ensure   => present,
    provider => 'yum',
  }
}
