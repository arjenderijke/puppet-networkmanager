#
# networkmanager ifcfg file
#

define networkmanager::ifcfg_file (
  $device = undef,
  $nm_controlled = true,
  $hwaddr = undef,
  $ipaddr = undef,
  $netmask = undef,
  $network = undef,
  $broadcast = undef,
  $bootproto = 'dhcp',
  $interface_type = 'ethernet',
  $onboot = true,
  $defroute = true,
  $peerdns = true,
  $peerroutes = true,
  $gateway = undef,
  $zone = undef,
  $dns1 = undef,
  $dns2 = undef,
  $search = undef,
  $ethtool_opts = undef,
  $dhcp_hostname = undef,
  $hotplug = true,
  $linkdelay = undef,
  $userctl = false,
  $bridge = undef,
)  {

  concat { "ifcfg-${device}":
    ensure => present,
    path   => "/etc/sysconfig/network-scripts/ifcfg-${device}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
#    notify => Exec['nmcli_con_reload'],
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
    $controlledbynm = 'no'
  }

  concat::fragment { "ifcfg-${device}_nmcontrolled":
    target  => "ifcfg-${device}",
    content => "NM_CONTROLLED=${controlledbynm}\n",
    order   => '04',
  }

  if ($bootproto == 'none') {
    if ($ipaddr != undef) {
      concat::fragment { "ifcfg-${device}_ipaddr":
        target  => "ifcfg-${device}",
        content => "IPADDR=${ipaddr}\n",
        order   => '05',
      }
    }

    if ($netmask != undef) {
      concat::fragment { "ifcfg-${device}_netmask":
        target  => "ifcfg-${device}",
        content => "NETMASK=${netmask}\n",
        order   => '06',
      }
    }

    if ($network != undef) {
      concat::fragment { "ifcfg-${device}_network":
        target  => "ifcfg-${device}",
        content => "NETWORK=${network}\n",
        order   => '07',
      }
    }

    if ($broadcast != undef) {
      concat::fragment { "ifcfg-${device}_broadcast":
        target  => "ifcfg-${device}",
        content => "BROADCAST=${broadcast}\n",
        order   => '08',
      }
    }
  }

  if ($onboot) {
    $enableonboot = 'yes'
  } else {
    $enableonboot = 'no'
  }

  concat::fragment { "ifcfg-${device}_onboot":
    target  => "ifcfg-${device}",
    content => "ONBOOT=${enableonboot}\n",
    order   => '09',
  }

  if ($defroute) {
    $enabledefroute = 'yes'
  } else {
    $enabledefroute = 'no'
  }

  concat::fragment { "ifcfg-${device}_defroute":
    target  => "ifcfg-${device}",
    content => "DEFROUTE=${enabledefroute}\n",
    order   => '10',
  }

  if ($peerdns) {
    $enablepeerdns = 'yes'
  } else {
    $enablepeerdns = 'no'
  }

  concat::fragment { "ifcfg-${device}_peerdns":
    target  => "ifcfg-${device}",
    content => "PEERDNS=${enablepeerdns}\n",
    order   => '11',
  }

  if ($peerroutes) {
    $enablepeerroutes = 'yes'
  } else {
    $enablepeerroutes = 'no'
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

  case $interface_type {
    'ethernet' : {
      concat::fragment { "ifcfg-${device}_type":
        target  => "ifcfg-${device}",
        content => "TYPE=Ethernet\n",
        order   => '14',
      }
    }
    'infiniband' : {
      concat::fragment { "ifcfg-${device}_type":
        target  => "ifcfg-${device}",
        content => "TYPE=Infiniband\n",
        order   => '14',
      }
    }
    'bridge' : {
      concat::fragment { "ifcfg-${device}_type":
        target  => "ifcfg-${device}",
        content => "TYPE=Bridge\n",
        order   => '14',
      }
    }
    default : {
      fail('Unknown interface type in interface configuration')
    }
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

  concat::fragment { "ifcfg-${device}_bootproto":
    target  => "ifcfg-${device}",
    content => "BOOTPROTO=${bootproto}\n",
    order   => '17',
  }

  if ($gateway != undef) {
    concat::fragment { "ifcfg-${device}_gateway":
      target  => "ifcfg-${device}",
      content => "GATEWAY=${gateway}\n",
      order   => '18',
    }
  }

  if ($zone != undef) {
    concat::fragment { "ifcfg-${device}_zone":
      target  => "ifcfg-${device}",
      content => "ZONE=${zone}\n",
      order   => '19',
    }
  }

  if ($dns1 != undef) {
    concat::fragment { "ifcfg-${device}_dns1":
      target  => "ifcfg-${device}",
      content => "DNS1=${dns1}\n",
      order   => '20',
    }
  }

  if ($dns2 != undef) {
    concat::fragment { "ifcfg-${device}_dns2":
      target  => "ifcfg-${device}",
      content => "DNS2=${dns2}\n",
      order   => '21',
    }
  }

  if ($search != undef) {
    concat::fragment { "ifcfg-${device}_search":
      target  => "ifcfg-${device}",
      content => "SEARCH=${search}\n",
      order   => '22',
    }
  }

  if ($ethtool_opts != undef) {
    concat::fragment { "ifcfg-${device}_ethtool_opts":
      target  => "ifcfg-${device}",
      content => "ETHTOOL_OPTS=\"${ethtool_opts}\"\n",
      order   => '23',
    }
  }

  if ($dhcp_hostname != undef) {
    concat::fragment { "ifcfg-${device}_dhcp_hostname":
      target  => "ifcfg-${device}",
      content => "DHCP_HOSTNAME=${dhcp_hostname}\n",
      order   => '24',
    }
  }

  if ($hotplug) {
    $ishotplug = 'yes'
  } else {
    $ishotplug = 'no'
  }

  # Only add line to configuration file if value is
  # different from the default.
  unless ($hotplug) {
    concat::fragment { "ifcfg-${device}_hotplug":
      target  => "ifcfg-${device}",
      content => "HOTPLUG=${ishotplug}\n",
      order   => '25',
    }
  }

  if ($linkdelay != undef) {
    concat::fragment { "ifcfg-${device}_linkdelay":
      target  => "ifcfg-${device}",
      content => "LINKDELAY=${linkdelay}\n",
      order   => '26',
    }
  }

  if ($userctl) {
    $isuserctl = 'yes'
  } else {
    $isuserctl = 'no'
  }

  if ($userctl) {
    concat::fragment { "ifcfg-${device}_userctl":
      target  => "ifcfg-${device}",
      content => "HOTPLUG=${isuserctl}\n",
      order   => '27',
    }
  }

  if ($bridge != undef) {
    concat::fragment { "ifcfg-${device}_bridge":
      target  => "ifcfg-${device}",
      content => "BRIDGE=${bridge}\n",
      order   => '28',
    }
  }
}
