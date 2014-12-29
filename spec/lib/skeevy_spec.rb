require 'skeevy'

RSpec.describe :skeevy do

  describe :register! do
    it 'requires an identifier' do
      expect { Skeevy.register! }.to raise_error(ArgumentError, /identifier/)
    end

    it 'validates engine type' do
      expect {
        Skeevy.register!(identifier: :test, engine: "My Engine")
      }.to raise_error(ArgumentError, /Engine!/)
    end

    it 'validates cutter type' do
      expect {
        Skeevy.register!(identifier: :test, cutter: "My Cutter")
      }.to raise_error(ArgumentError, /Cutter!/)
    end
  end

  describe :inspect do
    it 'outputs the proper string' do
      expect(Skeevy.inspect).to eq "Skeevy #{Skeevy::VERSION}"
    end
  end

end