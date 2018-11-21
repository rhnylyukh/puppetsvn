class subversion (
  $subversion_tree      = $subversion::params::subversion_tree,
  $subversion_package   = $subversion::params::subversion_package,
  $subversion_directory = $subversion::params::subversion_directory,
  $project_name         = $subversion::params::project_name,
) inherits subversion::params {

  contain '::subversion::install'
  contain '::subversion::configure'

  Class['::subversion::install']
  -> Class['::subversion::configure']
}