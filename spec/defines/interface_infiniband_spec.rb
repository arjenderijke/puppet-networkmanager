require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'infiniband1' }
  let(:params) { 
    { :device => 'ib0', 
      :hwaddr => 'aa:bb:cc:dd:ee:ff',
      :bootproto => 'none',
      :ipaddr => '10.0.0.1',
      :netmask => '255.255.255.0',
      :network => '10.0.0.0',
      :broadcast => '10.0.0.255',
      :interface_type => 'infiniband',
    } 
  }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_ipaddr").with_content("IPADDR=#{params[:ipaddr]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_netmask").with_content("NETMASK=#{params[:netmask]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_network").with_content("NETWORK=#{params[:network]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_broadcast").with_content("BROADCAST=#{params[:broadcast]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_interface_type").with_content("TYPE=#{params[:interface_type]}\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_gateway").with_content("GATEWAY=\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_zone") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns1") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns2") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_search") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_ethtool_ops") }
  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dhcp_hostname") }
end
