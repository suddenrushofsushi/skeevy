require 'fileutils'

RSpec.describe :directory_file do

  let!(:dfs) { Skeevy::Engines::DirectoryFile.new(instance: nil, base_dir: 'tmp', delimiter: '-') }
  let!(:write_key) { 'a-b-c-file.json' }
  include_examples "a skeevy engine"

  describe '.write! verification' do
    it 'should create the appropriate directory' do
      write_file
      expect(File.directory?('tmp/a/b/c')).to be_truthy
    end

    it 'should create the appropriate file' do
      write_file
      expect(File.exist?('tmp/a/b/c/file.json')).to be_truthy
    end
  end

  describe '.delete! verification' do
    it 'should remove the file' do
      write_file
      dfs.delete!(key: write_key)
      expect(File.exist?('tmp/a/b/c/file.json')).to be_falsey
    end
  end

  def write_file
    dfs.write!(key: write_key, content: '{}')
  end

end