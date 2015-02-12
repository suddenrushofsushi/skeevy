RSpec.describe :zlib_compression do
  let(:filter) { Skeevy::Filters::ZlibCompression.new }

  describe '#filter_write' do
    it 'zlib deflates the content' do
      expect(filter.filter_write(content: 'testing')).to eq Zlib.deflate('testing')
    end
  end

  describe '#filter_read' do
    it 'zlib inflates the content' do
      expect(filter.filter_read(content: Zlib.deflate('testing'))).to eq 'testing'
    end
  end
end