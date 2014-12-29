module Skeevy
  module Cutter

    attr_accessor :instance
    attr_reader :delimiter
    attr_reader :prefix

    def initialize(instance:, delimiter: '-', prefix: nil)
      raise(ArgumentError, "Unable to init Skeevy Cutters without a delimiter") if delimiter.nil?
      @instance  = instance
      @delimiter = delimiter
      @prefix    = prefix
    end

    def cut_key(hash:, ns:, object: nil)
      raise NoMethodError, "Your Cutter is invalid."
    end
  end
end
