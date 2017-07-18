# timezone

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What timezone affects](#what-timezone-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with timezone](#beginning-with-timezone)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

sets timezone

## Module Description

sets timezone coping the actual timezone file to /etc/localtime

## Setup

### What timezone affects

* /etc/localtime
* manages timezone's package (usually it's called **tzdata**)

### Setup Requirements

This module requires pluginsync enabled

### Beginning with timezone

```puppet
class { 'timezone':
  region   => 'Europe',
  locality => 'Andorra',
}
```

Set UTC:

```
class { 'timezone':
  timezonename => 'UTC',
}
```

## Usage

It just sets localtime to the appropriate timezone, it doesn't do much fancy stuff.

## Reference

### timezone
* **region**: region to be used (default: **Europe**)
* **locality**: locality to be used (default: **Andorra**)
* **timezonename**: timezone to set, if it is defined, overrides **region** and **locality**
* **manage_package**: manage package, usually it's called tzdata (default: **true**)
* **package_ensure**: package's ensure (default: **installed**)

## Limitations

should work anywhere

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

Nothing so far

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
