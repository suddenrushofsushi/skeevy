module Skeevy
  module Engines
    class DirectoryFile
      include Skeevy::Engine
      require 'fileutils'

      def initialize(instance: nil, base_dir:, delimiter:, encoding: 'UTF-8')
        raise ArgumentError,
              "Instance passed was not a Skeevy::Instance" unless
            instance.is_a?(Skeevy::Instance) || instance.nil?
        @base_dir     = base_dir
        @encoding     = encoding
        @instance     = instance
        @delimiter    = delimiter
        @exists_cache = {}
        ensure_base_dir_exists
      end

      def path_for(key:)
        directory = key.split(@delimiter)
        filename  = directory.pop # naive
        path      = File.join(@base_dir, directory)
        ensure_exists(path: path)
        File.join(path, filename)
      end

      def exist?(key:, path: nil)
        if path.nil?
          File.exist? path_for(key: key)
        else
          File.exist? path
        end
      end

      def read(key:)
        path = path_for(key: key)
        if exist?(path: path, key: nil)
          IO.binread(path)
        else
          nil
        end
      end

      def write!(key:, content:)
        path = path_for(key: key)
        IO.binwrite(path, content)
      end

      def delete!(key:)
        path = path_for(key: key)
        if exist?(path: path, key: nil)
          File.unlink(path)
          return true
        end
        false
      end

      private

      def ensure_exists(path:)
        FileUtils.mkdir_p(path) if @exists_cache[path].nil?
        @exists_cache[path] = true
      end

      def ensure_base_dir_exists
        ensure_exists(path: @base_dir)
      end
    end
  end
end