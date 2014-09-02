require 'spec_helper'

describe 'networkmanager' do

  it do
    should contain_service('NetworkManager').with(
                                                  'ensure' => 'running',
                                                  'enable' => true,
                                                  'require' => 'Package[NetworkManager]',

                                                  )
  end
end
