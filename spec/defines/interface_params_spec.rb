require 'spec_helper'

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :nm_controlled => 'error'
    }
  }

  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /"error" is not a boolean/)
  end
end

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :onboot => 'error'
    }
  }

  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /"error" is not a boolean/)
  end
end

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :bootproto => 'error'
    }
  }

  # The error message that is returned is:
  # Puppet::Error: validate_re(): "error" does not match "^(none|dhcp)$"
  # Since we do a regex match on a string that contains a regex,
  # this becomes tricky and you need to escape all relevant characters
  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /validate_re\(\): "error" does not match "\^\(none|dhcp\)\$"/)
  end
end

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :defroute => 'error'
    }
  }

  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /"error" is not a boolean/)
  end
end

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :peerdns => 'error'
    }
  }

  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /"error" is not a boolean/)
  end
end

describe 'networkmanager::interface' do
  let :facts do
    { :concat_basedir => '/dne' } 
  end

  let(:title) { 'interface1' }
  let(:params) { 
    { :device => 'eth0',
      :peerroutes => 'error'
    }
  }

  it do
    expect {
      should compile
    }.to raise_error(Puppet::Error, /"error" is not a boolean/)
  end
end
