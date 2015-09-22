require 'spec_helper'

describe 'networkmanager' do

  it do
    should contain_service('NetworkManager').with(
                                                  'ensure' => 'running',
                                                  'enable' => true,
                                                  'require' => 'Package[NetworkManager]'

                                                  )
    should contain_package('NetworkManager').with_ensure('installed')
  end
end
