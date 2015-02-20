module Skeevy
  module Filters
    class ZlibCompression
      include Skeevy::Filters
      require 'zlib'

      def filter_write(content:)
        Zlib.deflate(content)
      end

      def filter_read(content:)
        Zlib.inflate(content)
      end
    end
  end
end

