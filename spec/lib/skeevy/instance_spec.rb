RSpec.describe :instance, fakefs: true do

  let(:instance) { Skeevy::Instance.new(identifier: :test) }
  let(:cutter) { instance.cutter }
  let(:engine) { instance.engine }

  describe '#object_key' do
    it 'passes the function to @cutter' do
      expect(cutter).to receive(:cut).with(hash: 'abc', ns: 'test', object: 'test')
      instance.object_key(hash: 'abc', ns: 'test', object: 'test')
    end
  end

  describe '#container_key' do
    it 'passes the function to @cutter' do
      expect(cutter).to receive(:cut).with(hash: 'abc', ns: 'test', object: nil)
      instance.container_key(hash: 'abc', ns: 'test')
    end
  end

  describe '#read' do
    it 'passes the function to @engine' do
      expect(engine).to receive(:read).with(key: 'abc')
      instance.read(key: 'abc')
    end
  end

  describe '#write!' do
    it 'passes the function to @engine' do
      expect(engine).to receive(:write!).with(key: 'abc', content: 'testing')
      instance.write!(key: 'abc', content: 'testing')
    end
  end

  describe '#exist?' do
    it 'passes the function to @engine' do
      expect(engine).to receive(:exist?).with(key: 'abc')
      instance.exist?(key: 'abc')
    end
  end

  describe '#delete!' do
    it 'passes the function to @engine' do
      expect(engine).to receive(:delete!).with(key: 'abc')
      instance.delete!(key: 'abc')
    end
  end

end