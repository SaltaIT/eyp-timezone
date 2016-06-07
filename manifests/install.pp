# == Class: timezone
#
# === timezone::install documentation
#
class timezone::install inherits timezone {

  if($timezone::manage_package)
  {
    package { $timezone::params::packagename:
      ensure => $timezone::package_ensure,
    }
  }

}
