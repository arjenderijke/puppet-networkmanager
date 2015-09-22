require 'spec_helper'

describe 'networkmanager::interface' do
  let(:node) { 'no_include' }
  let(:title) { 'interface1' }
  let(:params) { {:device => 'eth0'} }

#  it do
#    expect {
#      should compile
  #    }.to raise_error(Puppet::Error, /You must include the base class before defining an interface/)
  it { should compile.and_raise_error(/You must include the base class before defining an interface/) }
  end
end
