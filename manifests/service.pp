class timezone::service inherits timezone {

  #
  validate_bool($timezone::manage_docker_service)
  validate_bool($timezone::manage_service)
  validate_bool($timezone::service_enable)

  validate_re($timezone::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${timezone::service_ensure}")

  if(getvar('::eyp_docker_iscontainer')==undef or
      getvar('::eyp_docker_iscontainer')==false or
      getvar('::eyp_docker_iscontainer') =~ /false/ or
      $timezone::manage_docker_service)
  {
    if($timezone::manage_service)
    {
      #service or exec here
    }
  }
}
