module Skeevy
  module Filters
    class Rot13
      include Skeevy::Filters

      def filter_write(content:)
        content.tr!("abcdefghijklmnopqrstuvwxyz",
                  "nopqrstuvwxyzabcdefghijklm")
      end

      def filter_read(content:)
        filter_write(content: content)
      end
    end
  end
end