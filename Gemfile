source :rubygems

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 2.7']
end

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet'
gem 'puppetlabs_spec_helper'
gem 'puppet', puppetversion
if "#{ENV['PUPPET_VERSION']}" == '3.8.7'
  gem 'safe_yaml'
end
