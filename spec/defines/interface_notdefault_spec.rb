require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0', 
      :hwaddr => '00:11:22:33:44:55',
      :nm_controlled => false,
      :onboot => false,
      :defroute => false,
      :peerdns => false,
      :peerroutes => false,
      :hotplug => false,
    }    
  }

  let (:controlledbynm) { 'no' }
  let (:enableonboot) { 'no' }
  let (:enabledefroute) {'no'}
  let (:enablepeerdns) {'no'}
  let (:enablepeerroutes) {'no'}
  let (:hotplug) {'no'}

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_nmcontrolled").with_content("NM_CONTROLLED=#{controlledbynm}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_onboot").with_content("ONBOOT=#{enableonboot}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_defroute").with_content("DEFROUTE=#{enabledefroute}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_peerdns").with_content("PEERDNS=#{enablepeerdns}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_peerroutes").with_content("PEERROUTES=#{enablepeerroutes}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_hotplug").with_content("HOTPLUG=#{hotplug}\n") }

end
