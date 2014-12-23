module Skeevy
  module Engines
    class DirectoryFile
      include Skeevy::Engine

      def initialize(base_dir:)
        raise(ArgumentError, "#{base_dir} must exist to use the File Engine.") unless File.directory?(base_dir)
        @base_dir = base_dir
      end

      def path_for(id:, ns:, object: nil)
        raise ArgumentError, "Missing id or ns" if id.nil? || ns.nil?
        path = "#{@base}#{id[0]}/#{ns}/#{id[1..3]}/#{id[4..39]}/"
        ensemble_mkdir!(path) if filename.nil?
        if filename.nil?
          path
        else
          File.join(path, filename.to_s)
        end
      end

      def exist?(id, ns, object)
        File.exist? path_for(id, ns, filename)
      end

      def read(id, ns, object=nil)
        path = path_for(id, ns, object)
        File.open(path, "w:#{encoding}") { |f|
          f.write contents
        }
      end

      def write(id, ns, object)
        path = ensemble_path(id, ns, object)
        File.open(path, "w:#{encoding}") { |f|
          f.write contents
        }
      end
    end
  end
end