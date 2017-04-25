class timezone::config inherits timezone {

  if($timezone::params::timedatectl)
  {
    exec { 'set timezone - timedatectl':
      command => "timedatectl set-timezone ${timezone::region}/${timezone::locality}",
      unless  => "timedatectl status | grep \"Time zone: ${timezone::region}/${timezone::locality}\"",
      path    => '/usr/sbin:/usr/bin:/sbin:/bin',
    }
  }
  else
  {
    file { '/etc/localtime':
      source  => "file:///usr/share/zoneinfo/${timezone::region}/${timezone::locality}",
      links   => 'follow',
      replace => true,
      mode    => '0644',
    }
  }
}
