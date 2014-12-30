require 'skeevy'
require 'shared/engine'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:all) do
    FileUtils.rm_rf(Dir["tmp/[^.]*"])
  end

end
