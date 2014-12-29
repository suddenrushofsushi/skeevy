require 'skeevy'

RSpec.describe :skeevy do

  let!(:default_instance) { Skeevy.register!(identifier: :default) }

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

  describe 'default instantiation' do

    it 'creates a default instance with only an identifier' do
      expect(default_instance).to be_instance_of(Skeevy::Instance)
    end

    it 'has a StandardKey cutter' do
      expect(default_instance.cutter).to be_instance_of(Skeevy::Cutters::StandardKey)
    end

    it 'has a DirectoryFile engine' do
      expect(default_instance.engine).to be_instance_of(Skeevy::Engines::DirectoryFile)
    end

    it 'makes the default Skeeve available via .instance' do
      my_instance = Skeevy.instance(:default)
      expect(my_instance).to equal(default_instance)
    end

    it 'ensures [] is equivalent to .instance' do
      expect(Skeevy.instance(:default)).to equal(Skeevy[:default])
    end

  end

  describe :inspect do
    it 'outputs the proper string' do
      expect(Skeevy.inspect).to eq "Skeevy #{Skeevy::VERSION}"
    end
  end

end