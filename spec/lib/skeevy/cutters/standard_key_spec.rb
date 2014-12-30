RSpec.describe :standard_key do

  let!(:the_cutter_class) { Skeevy::Cutters::StandardKey }
  let!(:the_cutter) { Skeevy::Cutters::StandardKey.new }
  include_examples "a skeevy cutter"

  describe '#cut verification' do
    it 'creates appropriate keys without object' do
      expect(the_cutter.cut(hash: 'abc', ns: 'test')).to eq('test-abc')
    end
    it 'creates appropriate keys with object' do
      expect(the_cutter.cut(hash: 'abc',
                            ns: 'test',
                            object: 'file.json')).to eq('test-abc-file.json')
    end
  end

end