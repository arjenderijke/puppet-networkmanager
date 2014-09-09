require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0', 
      :bootproto => 'none',
      :ipaddr => '10.0.0.1',
      :netmask => '255.255.255.0',
      :network => '10.0.0.0',
      :broadcast => '10.0.0.255',
    } 
  }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_ipaddr").with_content("IPADDR=#{params[:ipaddr]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_netmask").with_content("NETMASK=#{params[:netmask]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_network").with_content("NETWORK=#{params[:network]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_broadcast").with_content("BROADCAST=#{params[:broadcast]}\n") }

end