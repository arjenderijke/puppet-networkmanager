#
# networkmanager interface
#

define networkmanager::interface (
  $device = undef,
  $nm_controlled = true,
  $hwaddr = undef,
  $ipaddr = undef,
  $netmask = undef,
  $network = undef,
  $broadcast = undef,
  $bootproto = 'dhcp',
  $onboot = true,
  $defroute = true,
  $peerdns = true,
  $peerroutes = true
) {
  if (!defined(Class['networkmanager'])) {
    fail('You must include the base class before defining an interface')
  }

  validate_bool($nm_controlled)
  validate_bool($onboot)
  validate_re($bootproto, '^(none|dhcp)$')
  validate_bool($defroute)
  validate_bool($peerdns)
  validate_bool($peerroutes)

  concat { "ifcfg-${device}":
    ensure => present,
    path   => "/etc/sysconfig/network-scripts/ifcfg-${device}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Exec['nmcli_con_reload'],
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

  if ($bootproto == 'none') {
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

  if ($defroute) {
    $enabledefroute = 'yes'
  } else {
    $enabledefroute = 'false'
  }

  concat::fragment { "ifcfg-${device}_defroute":
    target  => "ifcfg-${device}",
    content => "DEFROUTE=${enabledefroute}\n",
    order   => '10',
  }

  if ($peerdns) {
    $enablepeerdns = 'yes'
  } else {
    $enablepeerdns = 'false'
  }

  concat::fragment { "ifcfg-${device}_peerdns":
    target  => "ifcfg-${device}",
    content => "PEERDNS=${enablepeerdns}\n",
    order   => '11',
  }

  if ($peerroutes) {
    $enablepeerroutes = 'yes'
  } else {
    $enablepeerroutes = 'false'
  }

  concat::fragment { "ifcfg-${device}_peerroutes":
    target  => "ifcfg-${device}",
    content => "PEERROUTES=${enablepeerroutes}\n",
    order   => '12',
  }

  concat::fragment { "ifcfg-${device}_ipv6init":
    target  => "ifcfg-${device}",
    content => "IPV6INIT=no\n",
    order   => '13',
  }

  concat::fragment { "ifcfg-${device}_type":
    target  => "ifcfg-${device}",
    content => "TYPE=Ethernet\n",
    order   => '14',
  }

  concat::fragment { "ifcfg-${device}_ipv4failurefatal":
    target  => "ifcfg-${device}",
    content => "IPV4_FAILURE_FATAL=no\n",
    order   => '15',
  }

  concat::fragment { "ifcfg-${device}_ipv6autoconf":
    target  => "ifcfg-${device}",
    content => "IPV6_AUTOCONF=no\n",
    order   => '16',
  }
}
