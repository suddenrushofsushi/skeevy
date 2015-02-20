module Skeevy
  module Engines
    class SymbolicHash
      include Skeevy::Engine

      def initialize(instance: nil)
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
        k = key.to_sym
        if @items.has_key?(k)
          @items.delete k
          return true
        end
        false
      end

      def keys
        @items.keys.map(&:to_s)
      end
    end
  end
end