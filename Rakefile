require 'puppet-lint/tasks/puppet-lint'

require 'rake'

require 'rspec/core/rake_task'

require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.send('disable_autoloader_layout')

RSpec::Core::RakeTask.new(:spec) do |t|
   t.pattern = 'spec/*/*_spec.rb'
end

task :default => [:spec, :lint]
