RSpec.describe :redis do
  let!(:the_engine_class) { Skeevy::Engines::Redis }
  let!(:the_engine) { the_engine_class.new(instance: nil) }

  before(:each) do
    Redis.new(db: 1).flushdb
  end

  include_examples "a skeevy engine"
end