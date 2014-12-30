RSpec.describe :symbolic_hash do

  let!(:dfs) { Skeevy::Engines::SymbolicHash.new(instance: nil) }
  include_examples "a skeevy engine"

end
