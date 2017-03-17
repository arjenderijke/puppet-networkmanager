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
  $bridge_name = undef,
) {
  if (!defined(Class['networkmanager'])) {
    fail('You must include the base class before defining an interface')
  }

  validate_bool($nm_controlled)
  validate_bool($onboot)
  validate_re($bootproto, '^(none|dhcp)$')
  validate_re($interface_type, '^(ethernet|infiniband|bridge)$')
  validate_bool($defroute)
  validate_bool($peerdns)
  validate_bool($peerroutes)
  validate_bool($hotplug)
  if ($linkdelay != undef) {
    validate_integer($linkdelay)
  }
  validate_bool($userctl)

  case $interface_type {
    ethernet: {
      ifcfg_file {"interface_${device}":
        device         => $device,
        nm_controlled  => $nm_controlled,
        hwaddr         => $hwaddr,
        ipaddr         => $ipaddr,
        netmask        => $netmask,
        network        => $network,
        broadcast      => $broadcast,
        bootproto      => $bootproto,
        interface_type => $interface_type,
        onboot         => $onboot,
        defroute       => $defroute,
        peerdns        => $peerdns,
        peerroutes     => $peerroutes,
        gateway        => $gateway,
        zone           => $zone,
        dns1           => $dns1,
        dns2           => $dns2,
        search         => $search,
        ethtool_opts   => $ethtool_opts,
        dhcp_hostname  => $dhcp_hostname,
        hotplug        => $hotplug,
        linkdelay      => $linkdelay,
        userctl        => $userctl,
      }
    }
    infiniband: {
      ifcfg_file {"interface_${device}":
        device         => $device,
        nm_controlled  => $nm_controlled,
        hwaddr         => $hwaddr,
        ipaddr         => $ipaddr,
        netmask        => $netmask,
        network        => $network,
        broadcast      => $broadcast,
        bootproto      => $bootproto,
        interface_type => $interface_type,
        onboot         => $onboot,
        defroute       => $defroute,
        peerdns        => $peerdns,
        peerroutes     => $peerroutes,
        gateway        => $gateway,
        zone           => $zone,
        dns1           => $dns1,
        dns2           => $dns2,
        search         => $search,
        ethtool_opts   => $ethtool_opts,
        dhcp_hostname  => $dhcp_hostname,
        hotplug        => $hotplug,
        linkdelay      => $linkdelay,
        userctl        => $userctl,
      }
    }
    bridge: {
      ifcfg_file {"interface_${device}":
        device         => $device,
        nm_controlled  => $nm_controlled,
        hwaddr         => $hwaddr,
        ipaddr         => $ipaddr,
        netmask        => $netmask,
        network        => $network,
        broadcast      => $broadcast,
        bootproto      => $bootproto,
        interface_type => $interface_type,
        onboot         => $onboot,
        defroute       => $defroute,
        peerdns        => $peerdns,
        peerroutes     => $peerroutes,
        gateway        => $gateway,
        zone           => $zone,
        dns1           => $dns1,
        dns2           => $dns2,
        search         => $search,
        ethtool_opts   => $ethtool_opts,
        dhcp_hostname  => $dhcp_hostname,
        hotplug        => $hotplug,
        linkdelay      => $linkdelay,
        userctl        => $userctl,
      }

      ifcfg_file {"interface_${bridge_name}":
        device         => $bridge_name,
        nm_controlled  => $nm_controlled,
        hwaddr         => $hwaddr,
        ipaddr         => $ipaddr,
        netmask        => $netmask,
        network        => $network,
        broadcast      => $broadcast,
        bootproto      => $bootproto,
        interface_type => $interface_type,
        onboot         => $onboot,
        defroute       => $defroute,
        peerdns        => $peerdns,
        peerroutes     => $peerroutes,
        gateway        => $gateway,
        zone           => $zone,
        dns1           => $dns1,
        dns2           => $dns2,
        search         => $search,
        ethtool_opts   => $ethtool_opts,
        dhcp_hostname  => $dhcp_hostname,
        hotplug        => $hotplug,
        linkdelay      => $linkdelay,
        userctl        => $userctl,
      }

    }
    default: {
      fail('Unknown interface type in interface configuration')
    }
  }
}
