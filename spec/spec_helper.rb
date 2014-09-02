dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.join(dir, 'lib')

require 'mocha'
require 'puppet'
require 'rspec'
#require 'spec/autorun'

Spec::Runner.configure do |config|
    config.mock_with :mocha
end

# We need this because the RAL uses 'should' as a method.  This
# allows us the same behaviour but with a different method name.
class Object
    alias :must :should
end

require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', '..', 'fixtures'))

RSpec.configure do |c|
   c.module_path = File.join(fixture_path, 'modules')
   c.manifest_dir = File.join(fixture_path, 'manifests')
end
