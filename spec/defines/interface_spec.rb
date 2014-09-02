require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { {:device => 'eth0'} }

  it { should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth0') }

end
