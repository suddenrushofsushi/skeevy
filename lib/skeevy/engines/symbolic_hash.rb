module Skeevy
  module Engines
    class SymbolicHash
      include Skeevy::Engine

      def initialize(instance:)
        raise ArgumentError,
              "Instance passed was not a Skeevy::Instance" unless
              instance.is_a?(Skeevy::Instance) || instance.nil?
        @instance = instance
        @items = {}
      end

      def exist?(key:)
        @items.has_key? key.to_sym
      end

      def read(key:)
        @items[key.to_sym]
      end

      def write!(key:, content:)
        @items[key.to_sym] = content
      end

      def delete!(key:)
        @items.delete key.to_sym
      end

    end
  end
end