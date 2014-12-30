require 'set'

RSpec.shared_examples 'a skeevy cutter' do

  describe '.initialize accepts only proper instances' do
    it 'allows nil instances' do
      expect(the_cutter).to be_a_kind_of(Skeevy::Cutter)
    end
    it 'rejects badly typed instances' do
      expect {
        the_cutter_class.new(instance: :nope)
      }.to raise_error(ArgumentError, /was not a/)
    end
    it 'rejects missing delimiter' do
      expect {
        the_cutter_class.new(delimiter: nil)
      }.to raise_error(ArgumentError, /without a/)
    end
  end

  describe '#cut' do
    it 'rejects missing keywords' do
      expect {
        the_cutter.cut(hash: '')
      }.to raise_error(ArgumentError, /missing keyword/)
      expect {
        the_cutter.cut(ns: '')
      }.to raise_error(ArgumentError, /missing keyword/)
    end
    it 'returns a string' do
      expect(the_cutter.cut(hash: 'abc', ns: 'test')).to be_instance_of(String)
      expect(the_cutter.cut(hash: 'abc', ns: 'test', object: 'file.json')).to be_instance_of(String)
    end
    it 'rejects empty hashes' do
      expect {
        the_cutter.cut(hash: '', ns: 'test')
      }.to raise_error(ArgumentError, /not be blank/)
      expect {
        the_cutter.cut(hash: nil, ns: 'test')
      }.to raise_error(ArgumentError, /not be blank/)
    end
    it 'rejects empty namespaces' do
      expect {
        the_cutter.cut(hash: 'abc', ns: '')
      }.to raise_error(ArgumentError, /not be blank/)
      expect {
        the_cutter.cut(hash: 'abc', ns: nil)
      }.to raise_error(ArgumentError, /not be blank/)
    end
    it 'rejects object names containing the class delimiter' do
      expect {
        the_cutter.cut(hash: 'abc', ns: 'test', object: 'bad-object-name.json')
      }.to raise_error(ArgumentError, /of delimiter/)
    end

  end

end