require 'fileutils'

RSpec.describe :directory_file do

  let!(:the_engine_class) { Skeevy::Engines::DirectoryFile }
  let!(:the_engine) { the_engine_class.new(instance: nil, base_dir: 'tmp', delimiter: '-') }
  let!(:write_key) { 'a-b-c-file.json' }
  include_examples "a skeevy engine"

  describe ".initialize verification" do
    it 'rejects badly typed instances' do
      expect {
        the_engine_class.new(instance: :nope, base_dir: 'tmp', delimiter: '-')
      }.to raise_error(ArgumentError, /was not a/)
    end
    it 'rejects missing keywords' do
      expect {
        the_engine_class.new(delimiter: '-')
      }.to raise_error(ArgumentError, /missing keywords/)
      expect {
        the_engine_class.new(base_dir: 'tmp')
      }.to raise_error(ArgumentError, /missing keywords/)
    end
  end

  describe '#write! verification' do
    it 'should create the appropriate directory' do
      write_file
      expect(File.directory?('tmp/a/b/c')).to be_truthy
    end

    it 'should create the appropriate file' do
      write_file
      expect(File.exist?('tmp/a/b/c/file.json')).to be_truthy
    end
  end

  describe '#delete! verification' do
    it 'should remove the file' do
      write_file
      the_engine.delete!(key: write_key)
      expect(File.exist?('tmp/a/b/c/file.json')).to be_falsey
    end
  end

  def write_file
    the_engine.write!(key: write_key, content: '{}')
  end

end