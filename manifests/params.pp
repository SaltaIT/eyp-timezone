class timezone::params {

  case $::osfamily
  {
    'redhat':
    {
      $packagename='tzdata'
      case $::operatingsystemrelease
      {
        /^[5-6].*$/:
        {
          $timedatectl=false
        }
        /^7.*$/:
        {
          $timedatectl=true
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $packagename='tzdata'
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^1[46].*$/:
            {
              $timedatectl=false
            }
            /^18.*$/:
            {
              $timedatectl=true
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    'Suse':
    {
      case $::operatingsystem
      {
        'SLES':
        {
          case $::operatingsystemrelease
          {
            '11.3':
            {
              $packagename='timezone'
              $timedatectl=false
            }
            '12.3':
            {
              $packagename='timezone'
              $timedatectl=true
            }
            default: { fail("Unsupported SLES version ${::operatingsystem} ${::operatingsystemrelease}") }
          }
        }
        default: { fail("Unsupported operating system ${::operatingsystem}") }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
