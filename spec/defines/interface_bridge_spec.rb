require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'bridge2' }
  let(:params) { 
    { :device => 'eth1',
      :hwaddr => 'aa:bb:cc:dd:ee:ff',
      :bootproto => 'dhcp',
      :interface_type => 'bridge',
      :bridge => 'br0',
    } 
  }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_ipaddr").with_content("IPADDR=#{params[:ipaddr]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_netmask").with_content("NETMASK=#{params[:netmask]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_network").with_content("NETWORK=#{params[:network]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_broadcast").with_content("BROADCAST=#{params[:broadcast]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_type").with_content("TYPE=#{params[:interface_type].capitalize}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_type").with_content("TYPE=Ethernet\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_gateway").with_content("GATEWAY=\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_zone") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns1") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns2") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_search") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_ethtool_ops") }
  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dhcp_hostname") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:bridge]}_ipaddr").with_content("IPADDR=#{params[:ipaddr]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:bridge]}_netmask").with_content("NETMASK=#{params[:netmask]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:bridge]}_network").with_content("NETWORK=#{params[:network]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:bridge]}_broadcast").with_content("BROADCAST=#{params[:broadcast]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:bridge]}_type").with_content("TYPE=#{params[:interface_type].capitalize}\n") }

end
