class subversion::params {
  $subversion_directory          = '/var/www/svn'
  $subversion_project_directory  = '/var/www/svn/projects'
  $subversion_package            = [ 'subversion', 'mod_dav_svn', ]
  $subversion_tree               = [ '/tmp', '/tmp/svn', '/tmp/svn/trunk', '/tmp/svn/branches', '/tmp/svn/tags', ]
  $project_name                  = 'foobar'
}
