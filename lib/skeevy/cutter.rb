module Skeevy
  module Cutter

    attr_accessor :instance
    attr_reader :delimiter
    attr_reader :prefix

    def initialize(instance: nil, delimiter: '-', prefix: nil)
      raise(ArgumentError, "Unable to init Skeevy Cutters without a delimiter") if delimiter.nil?
      raise ArgumentError,
            "Instance passed was not a Skeevy::Instance" unless
          instance.is_a?(Skeevy::Instance) || instance.nil?
      @instance  = instance
      @delimiter = delimiter
      @prefix    = prefix
    end

    def cut(hash:, ns:, object: nil)
      raise NoMethodError, "Your Cutter is invalid."
    end
  end
end
