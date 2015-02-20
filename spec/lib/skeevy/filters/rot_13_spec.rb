RSpec.describe :rot_13 do
  let(:filter) { Skeevy::Filters::Rot13.new }

  describe '#filter_write' do
    it 'performs a rot13 translation on the content' do
      expect(filter.filter_write(content: 'testing')).to eq 'grfgvat'
    end
  end

  describe '#filter_read' do
    it 'performs a reverse rot13 (same as rot13) on the content' do
      expect(filter.filter_write(content: 'grfgvat')).to eq 'testing'
    end
  end
end