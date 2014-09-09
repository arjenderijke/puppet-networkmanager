require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0', 
    } 
    
  }

  let(:controlledbynm) { 'yes' } 
  
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

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_hwaddr").with_content("HWADDR=#{params[:hwaddr]}\n") }

  it { should contain_concat__fragment("ifcfg-#{params[:device]}_nmcontrolled").with_content("NM_CONTROLLED=#{controlledbynm}\n") }

end
