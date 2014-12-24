require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'skeevy'

RSpec.describe :skeevy do

  let(:default_engine) { Skeevy::Engines::DirectoryFile.new(base_dir: '/tmp') }
  let(:default_cutter) { Skeevy::Cutters::StandardKey.new }

  describe :register! do
    it 'requires an identifier' do
      expect { Skeevy.register!(engine: default_engine, cutter: default_cutter) }.to raise_error ArgumentError
    end

    it 'requires an engine' do
      expect { Skeevy.register!(identifier: :test, cutter: default_cutter) }.to raise_error ArgumentError
    end

    it 'requires a cutter' do
      expect { Skeevy.register!(engine: default_engine, identifier: :test) }.to raise_error ArgumentError
    end

    it 'adds an entry to @instances' do
      Skeevy.register!(identifier: :test, engine: default_engine, cutter: default_cutter)
      expect(Skeevy.instance_variable_get('@instances')[:test]).to be_instance_of Skeevy::Instance
    end
  end

  describe :instance do
    let(:test_instance) { Skeevy::Instance.new(identifier: :test, engine: default_engine, cutter: default_cutter)}

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