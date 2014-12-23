module Skeevy
  module Cutters
    class StandardKey
      include Skeevy::Cutter

      def cut(id:, ns:, object: nil)
        id
      end

    end
  end
end