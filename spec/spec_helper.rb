require 'skeevy'
require 'fakefs/spec_helpers'
require 'shared/engine'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
