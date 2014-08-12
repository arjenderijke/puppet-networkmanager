# == Class: networkmanager
#
# Full description of class networkmanager here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { networkmanager:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Arjen de Rijke <arjenderijke@gmail.com>
#
# === Copyright
#
# Copyright 2014 Arjen de Rijke, unless otherwise noted.
#
class networkmanager {

  package { 'NetworkManager':
    ensure => installed,
  }

  service { 'NetworkManager':
    ensure  => running,
    enable  => true,
    require => Package['NetworkManager'],
  }

  exec { 'nmcli_con_reload':
    command => '/usr/bin/nmcli con reload',
  }
}
