require 'set'

RSpec.shared_examples 'a skeevy engine' do

  describe '#initialize accepts only proper instances' do
    it 'should allow nil instances' do
      expect(dfs).to be_a_kind_of(Skeevy::Engine)
    end
    it 'should reject badly typed instances' do
      expect {
        Skeevy::Engines::SymbolicHash.new(instance: :nope)
      }.to raise_error(ArgumentError, /was not a/)
    end
  end


  describe '#exist?' do
    k = 'abc'
    it 'properly identifies missing items' do
      expect(dfs.exist?(key: k)).to be_falsey
    end
    it 'properly identifes existing items' do
      dfs.write!(key: k, content: 'xyz')
      expect(dfs.exist?(key: k)).to be_truthy
    end
  end

  describe '#write!' do
    it 'writes to a key' do
      k = 'write_test-file.json'
      v = '{}'
      dfs.write!(key: k, content: v)
      expect(dfs.exist?(key: k)).to be_truthy
    end
  end

  describe '#read' do
    it 'returns proper results from a hash' do
      k = 'read_test-file.json'
      v = '{}'
      dfs.write!(key: k, content: v)
      expect(dfs.read(key: k)).to eq(v)
    end
    it 'returns nil when a key does not exist' do
      expect(dfs.read(key: 'missing_key_test')).to eq(nil)
    end
  end

  describe '#delete!' do
    it 'removes keys that exist' do
      k = 'delete_test-file.json'
      dfs.write!(key: k, content: '{}')
      expect(dfs.delete!(key: k)).to equal(true)
      expect(dfs.exist?(key: k)).to be_falsey
    end
  end

end