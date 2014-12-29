require 'skeevy'

RSpec.describe :skeevy do

  describe :register! do
    it 'requires an identifier' do
      expect { Skeevy.register! }.to raise_error(ArgumentError, /identifier/)
    end

    it 'validates engine type' do
      expect {
        Skeevy.register!(identifier: :test, engine: "My Engine")
      }.to raise_error(ArgumentError, /Engine!/)
    end

    it 'validates cutter type' do
      expect {
        Skeevy.register!(identifier: :test, cutter: "My Cutter")
      }.to raise_error(ArgumentError, /Cutter!/)
    end

    it 'adds an entry to @instances' do
      Skeevy.register!(identifier: :test)
      expect(Skeevy.instance_variable_get('@instances')[:test]).to be_instance_of Skeevy::Instance
    end
  end

  describe :instance do
    let(:test_instance) { Skeevy::Instance.new(identifier: :test)}

    it 'returns the instance at the given index' do
      Skeevy.instance_variable_set('@instances', {test: test_instance})
      expect(Skeevy.instance(:test)).to eq test_instance
    end
  end

  describe :inspect do
    it 'outputs the proper string' do
      expect(Skeevy.inspect).to eq "Skeevy #{Skeevy::VERSION}"
    end
  end

end