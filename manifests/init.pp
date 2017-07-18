class timezone(
                $manage_package        = true,
                $package_ensure        = 'installed',
                $region                = 'Europe',
                $locality              = 'Andorra',
                $timezonename          = undef,
              ) inherits timezone::params {

  class { '::timezone::install': }
  -> class { '::timezone::config': }
  -> Class['::timezone']

}
