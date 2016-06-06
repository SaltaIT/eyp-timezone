# == Class: timezone
#
# === timezone::install documentation
#
class timezone::install inherits timezone {

  if($timezone::manage_package)
  {
    # package here, for example: 
    #package { $timezone::params::package_name:
    #  ensure => $timezone::package_ensure,
    #}
  }

}
