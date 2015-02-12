require 'set'

RSpec.shared_examples 'a skeevy engine' do

  describe '.initialize accepts only proper instances' do
    it 'should allow nil instances' do
      expect(the_engine).to be_a_kind_of(Skeevy::Engine)
    end
    it 'should reject badly typed instances' do
      expect {
        Skeevy::Engines::SymbolicHash.new(instance: :nope)
      }.to raise_error(ArgumentError, /was not a/)
    end
  end

  describe '#exist?' do
    k = 'exist_test-file.json'
    it 'properly identifies missing items' do
      expect(the_engine.exist?(key: k)).to be_falsey
    end
    it 'properly identifies existing items' do
      the_engine.write!(key: k, content: 'xyz')
      expect(the_engine.exist?(key: k)).to be_truthy
    end
  end

  describe '#write!' do
    it 'writes to a key' do
      k = 'write_test-file.json'
      v = '{}'
      the_engine.write!(key: k, content: v)
      expect(the_engine.exist?(key: k)).to be_truthy
    end
  end

  describe '#read' do
    it 'returns proper results from a hash' do
      k = 'read_test-file.json'
      v = '{}'
      the_engine.write!(key: k, content: v)
      expect(the_engine.read(key: k)).to eq(v)
    end
    it 'returns nil when a key does not exist' do
      expect(the_engine.read(key: 'missing_key_test')).to eq(nil)
    end
  end

  describe '#delete!' do
    it 'removes keys that exist' do
      k = 'delete_test-file.json'
      the_engine.write!(key: k, content: '{}')
      expect(the_engine.delete!(key: k)).to equal(true)
      expect(the_engine.exist?(key: k)).to be_falsey
    end
  end

  describe '#keys' do
    it 'lists all existing keys' do
      puts the_engine.keys
      k = 'keys_test-file.json'
      k2 = 'a-b-c-file.json'
      the_engine.write!(key: k, content: '{}')
      the_engine.write!(key: k2, content: '{}')
      expect(the_engine.keys.sort).to eq ['a-b-c-file.json', 'keys_test-file.json']
    end
  end
end