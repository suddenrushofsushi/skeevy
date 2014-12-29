module Skeevy
  module Cutters
    class StandardKey
      include Skeevy::Cutter

      def cut(hash:, ns:, object: nil)
        prefix ="#{@prefix}#{@delimiter}" unless @prefix.nil?
        key = "#{ns}#{@delimiter}#{hash}"
        suffix = "#{@delimiter}#{object}" unless object.nil?
        "#{prefix}#{key}#{suffix}"
      end

    end
  end
end