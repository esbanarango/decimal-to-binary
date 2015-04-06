# spec/spec_helper.rb
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'

Dir["./spec/support/helpers/*.rb"].each { |f| puts f; require f }

RSpec.configure do |config|
  config.order = 'random'
  config.include ToDecimalHelpers
end