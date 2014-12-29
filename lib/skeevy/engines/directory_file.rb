module Skeevy
  module Engines
    class DirectoryFile
      include Skeevy::Engine

      def initialize(instance:, base_dir:, delimiter:, encoding: 'UTF-8')
        raise(ArgumentError, "#{base_dir} must exist to use the File Engine.") unless File.directory?(base_dir)
        @base_dir     = base_dir
        @encoding     = encoding
        @instance     = instance
        @delimiter    = delimiter
        @exists_cache = {}
      end

      def path_for(key:)
        directory = key.split(@delimiter)
        filename  = directory.pop
        path      = File.join(@base_dir, directory)
        ensure_exists(path)
        File.join(path, filename)
      end

      def exist?(key:)
        File.exist? path_for(key)
      end

      def read(key:)
        path = path_for(key)
        File.open(path, "w:#{@encoding}") { |f|
          f.write contents
        }
      end

      def write(key:, content:)
        path = path_for(key)
        File.open(path, "w:#{@encoding}") { |f|
          f.write contents
        }
      end

      def delete!(key:)
        path = path_for(key)
        File.unlink(path)
      end

      def ensure_exists(path:)
        FileUtils.mkdir_p(path) if @exists_cache[path].nil?
        @exists_cache[path] = true
      end
    end
  end
end