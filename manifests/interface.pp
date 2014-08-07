define networkmanager::interface (
  $device = undef,
  $nm_controlled = true,
  $ipaddr = undef,
  $netmask = undef,
  $network = undef,
  $broadcast = undef,
  $bootproto = "dhcp",
  $onboot = true
)
{
  concat { "ifcfg-${device}":
    ensure => present,
  }

  concat::fragment { "ifcfg-${device}_name":
    target  => "ifcfg-${device}",
    content => "NAME=\"System ${device}\"",
    order   => '01',
  }

  concat::fragment { "ifcfg-${device}_device":
    target  => "ifcfg-${device}",
    content => "DEVICE=",
    order   => '02',
  }

  # HWADDR=
  # NM_CONTROLLED=
  # IPADDR=
  # NETMASK=
  # NETWORK=
  # BROADCAST=
  # ONBOOT=
}
