define networkmanager::interface (
  $device = undef,
  $nm_controlled = true,
  $hwaddr = undef,
  $ipaddr = undef,
  $netmask = undef,
  $network = undef,
  $broadcast = undef,
  $bootproto = 'dhcp',
  $onboot = true
) {
  if (!defined(Class['networkmanager'])) {
    fail('You must include the base class before defining an interface')
  }

  validate_bool($nm_controlled)
  validate_bool($onboot)
  validate_re($bootproto, '^(none|dhcp)$')

  concat { "ifcfg-${device}":
    path   => "/etc/sysconfig/network-scripts/ifcfg-${device}",	 
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { "ifcfg-${device}_name":
    target  => "ifcfg-${device}",
    content => "NAME=\"System ${device}\"\n",
    order   => '01',
  }

  concat::fragment { "ifcfg-${device}_device":
    target  => "ifcfg-${device}",
    content => "DEVICE=${device}\n",
    order   => '02',
  }

  concat::fragment { "ifcfg-${device}_hwaddr":
    target  => "ifcfg-${device}",
    content => "HWADDR=${hwaddr}\n",
    order   => '03',
  }

  if ($nm_controlled) {
    $controlledbynm = 'yes'
  } else {
    $controlledbynm = 'false'
  }

  concat::fragment { "ifcfg-${device}_nmcontrolled":
    target  => "ifcfg-${device}",
    content => "NM_CONTROLLED=${controlledbynm}\n",
    order   => '04',
  }

  concat::fragment { "ifcfg-${device}_ipaddr":
    target  => "ifcfg-${device}",
    content => "IPADDR=${ipaddr}\n",
    order   => '05',
  }

  concat::fragment { "ifcfg-${device}_netmask":
    target  => "ifcfg-${device}",
    content => "NETMASK=${netmask}\n",
    order   => '06',
  }

  concat::fragment { "ifcfg-${device}_network":
    target  => "ifcfg-${device}",
    content => "NETWORK=${network}\n",
    order   => '07',
  }

  concat::fragment { "ifcfg-${device}_broadcast":
    target  => "ifcfg-${device}",
    content => "BROADCAST=${broadcast}\n",
    order   => '08',
  }

  if ($onboot) {
    $enableonboot = 'yes'
  } else {
    $enableonboot = 'false'
  }

  concat::fragment { "ifcfg-${device}_onboot":
    target  => "ifcfg-${device}",
    content => "ONBOOT=${enableonboot}\n",
    order   => '09',
  }
}
