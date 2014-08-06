define networkmanager::interface (
  $device = undef
) {
  $configfile = "ifcfg-${device}"
  # $data = "NAME=\"System ${device}\"" 
}
