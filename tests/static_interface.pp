include networkmanager

networkmanager::interface { 'interface1':
  device    => 'eth0',
  hwaddr    => '00:11:22:33:44:55',
  bootproto => 'none',
  ipaddr    => '10.0.0.1',
  netmask   => '255.255.255.0',
  network   => '10.0.0.0',
  broadcast => '10.0.0.255',
}
