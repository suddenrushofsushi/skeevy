module Skeevy
  module Cutters
    class StandardKey
      include Skeevy::Cutter

      def cut(id:, ns:, object: nil)
        key = ""
        key += "#{@prefix}#{@delimiter}" unless @prefix.nil?
        key += "#{ns}#{@delimiter}#{id}"
        key += "#{@delimiter}#{object}" unless object.nil?
        key
      end

    end
  end
end