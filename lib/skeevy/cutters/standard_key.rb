module Skeevy
  module Cutters
    class StandardKey
      include Skeevy::Cutter

      def cut(id:, ns:, object: nil)
        prefix ="#{@prefix}#{@delimiter}" unless @prefix.nil?
        key = "#{ns}#{@delimiter}#{id}"
        suffix = "#{@delimiter}#{object}" unless object.nil?
        "#{prefix}#{key}#{suffix}"
      end

    end
  end
end