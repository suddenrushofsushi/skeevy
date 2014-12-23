module Skeevy
  module Cutter
    def initialize(delimiter: '-', prefix: nil)
      raise(ArgumentError, "Unable to init Skeevy Cutters without a delimiter") if delimiter.nil?
      @delimiter = delimiter
      @prefix = prefix
    end

    def cut_key(id:, ns:, object: nil)
      raise NoMethodError, "Your Cutter is invalid."
    end
  end
end
