module Skeevy
  class Instance

    attr_reader :engine, :cutter

    def initialize(identifier:,
                   engine: nil,
                   cutter: nil)
      raise(ArgumentError, "identifier must be a Symbol") unless identifier.is_a?(Symbol)
      raise(ArgumentError, "engine is not a Skeevy Engine!") unless @engine.is_a?(Skeevy::Engine) || engine.nil?
      raise(ArgumentError, "cutter is not a Skeevy Cutter!") unless @cutter.is_a?(Skeevy::Cutter) || cutter.nil?
      @cutter = cutter || Skeevy::Cutters::StandardKey.new(instance: self)
      @engine = engine || Skeevy::Engines::DirectoryFile.new(base_dir: '/tmp', delimiter: @cutter.delimiter, instance: self)
      @identifier = identifier
    end

    def object_key(hash:, ns:, object:)
      @cutter.cut(hash: hash, ns: ns, object: object)
    end

    def container_key(hash:, ns:)
      @cutter.cut(hash: hash, ns: ns, object: nil)
    end

    def read(key:)
      @engine.read(key: key)
    end

    def write!(key:, content:)
      @engine.write!(key: key, content: content)
    end

    def exist?(key:)
      @engine.exist?(key: key)
    end

    def delete!(key:)
      @engine.delete!(key: key)
    end

    def to_s
      { identifier: @identifier, engine: @engine, cutter: @cutter}.to_s
    end

  end
end