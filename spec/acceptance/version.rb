
_osfamily               = fact('osfamily')
_operatingsystem        = fact('operatingsystem')
_operatingsystemrelease = fact('operatingsystemrelease').to_f

case _osfamily
when 'RedHat'
  $packagename = 'tzdata'

when 'Debian'
  $packagename = 'tzdata'

else
  $packagename = '-_-'

end
