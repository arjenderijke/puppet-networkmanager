require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0', 
      :hwaddr => '00:11:22:33:44:55',
    }    
  }

  let(:controlledbynm) { 'yes' } 
  let(:enableonboot) { 'yes' } 
  let(:enabledefroute) {'yes'}
  let(:enablepeerdns) {'yes'}
  let (:enablepeerroutes) {'yes'}
 
  it { should contain_concat("ifcfg-#{params[:device]}") }

  it { should contain_file("ifcfg-#{params[:device]}").with(
                                                             :ensure => 'present',
                                                             :path   => "/etc/sysconfig/network-scripts/ifcfg-#{params[:device]}"
                                                             ) }
  it { should contain_concat__fragment("ifcfg-#{params[:device]}_name").with_content("NAME=\"System #{params[:device]}\"\n") }

  it do 
    should contain_concat__fragment("ifcfg-#{params[:device]}_device").with(
                                                              {
                                                                'content' => "DEVICE=#{params[:device]}\n",
                                                              })

  end

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_ipaddr") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_netmask") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_network") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_broadcast") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_hwaddr").with_content("HWADDR=#{params[:hwaddr]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_nmcontrolled").with_content("NM_CONTROLLED=#{controlledbynm}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_onboot").with_content("ONBOOT=#{enableonboot}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_defroute").with_content("DEFROUTE=#{enabledefroute}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_peerdns").with_content("PEERDNS=#{enablepeerdns}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_peerroutes").with_content("PEERROUTES=#{enablepeerroutes}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_type").with_content("TYPE=Ethernet\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_ipv4failurefatal").with_content("IPV4_FAILURE_FATAL=no\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_ipv6autoconf").with_content("IPV6_AUTOCONF=no\n") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_zone") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns1") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_dns2") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_search") }

  it { should_not contain_concat__fragment("ifcfg-#{params[:device]}_ethtool_ops") }

end
