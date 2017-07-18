class timezone::config inherits timezone {

  if($timezone::timezonename!=undef)
  {
    $tzctl_command = "timedatectl set-timezone ${timezone::timezonename}"
    $tzctl_unless = "timedatectl status | grep \"Time zone: ${timezone::timezonename}\""

    $file_ln_tz = "file:///usr/share/zoneinfo/${timezone::timezonename}"
  }
  else
  {
    $tzctl_command = "timedatectl set-timezone ${timezone::region}/${timezone::locality}"
    $tzctl_unless = "timedatectl status | grep \"Time zone: ${timezone::region}/${timezone::locality}\""

    $file_ln_tz = "file:///usr/share/zoneinfo/${timezone::region}/${timezone::locality}"
  }

  if($timezone::params::timedatectl)
  {
    exec { 'set timezone - timedatectl':
      command => $tzctl_command,
      unless  => $tzctl_unless,
      path    => '/usr/sbin:/usr/bin:/sbin:/bin',
    }
  }
  else
  {
    file { '/etc/localtime':
      source  => $file_ln_tz,
      links   => 'follow',
      replace => true,
      mode    => '0644',
    }
  }
}
