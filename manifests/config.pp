# == Class: timezone
#
# === timezone::config documentation
#
class timezone::config inherits timezone {

  file { '/etc/localtime':
    source  => "file:///usr/share/zoneinfo/${timezone::region}/${timezone::locality}",
    links   => 'follow',
    replace => true,
    mode    => '0644',
  }

}
