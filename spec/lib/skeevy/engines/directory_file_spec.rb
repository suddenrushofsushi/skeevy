RSpec.describe :directory_file, fakefs: true do

  let!(:dfs) { Skeevy::Engines::DirectoryFile.new(instance: nil, base_dir: '/tmp', delimiter: '-') }
  include_examples "a skeevy engine"

  describe 'E:DF specific tests' do
    pending
  end

end