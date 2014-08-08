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

  concat::fragment { "ifcfg-${device}_hwaddr":
    target  => "ifcfg-${device}",
    content => "HWADDR=",
    order   => '03',
  }

  concat::fragment { "ifcfg-${device}_nmcontrolled":
    target  => "ifcfg-${device}",
    content => "NM_CONTROLLED=",
    order   => '04',
  }

  concat::fragment { "ifcfg-${device}_ipaddr":
    target  => "ifcfg-${device}",
    content => "IPADDR=",
    order   => '05',
  }

  concat::fragment { "ifcfg-${device}_netmask":
    target  => "ifcfg-${device}",
    content => "NETMASK=",
    order   => '06',
  }

  concat::fragment { "ifcfg-${device}_network":
    target  => "ifcfg-${device}",
    content => "NETWORK=",
    order   => '07',
  }

  concat::fragment { "ifcfg-${device}_broadcast":
    target  => "ifcfg-${device}",
    content => "BROADCAST=",
    order   => '08',
  }

  concat::fragment { "ifcfg-${device}_onboot":
    target  => "ifcfg-${device}",
    content => "ONBOOT=",
    order   => '09',
  }
}
