#
# networkmanager ifcfg file
#

define networkmanager::ifcfg_file (
  $device = undef,
)  {

  concat { "ifcfg-${device}":
    ensure => present,
    path   => "/etc/sysconfig/network-scripts/ifcfg-${device}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
#    notify => Exec['nmcli_con_reload'],
  }

}
