RSpec.describe :symbolic_hash do

  let!(:the_engine_class) { Skeevy::Engines::SymbolicHash }
  let!(:the_engine) { the_engine_class.new(instance: nil) }
  include_examples "a skeevy engine"

  describe ".initialize verification" do
    it 'rejects badly typed instances' do
      expect {
        the_engine_class.new(instance: :nope)
      }.to raise_error(ArgumentError, /was not a/)
    end
  end

end
