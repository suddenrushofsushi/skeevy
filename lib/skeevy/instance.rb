module Skeevy
  class Instance

    attr_reader :engine, :cutter

    def initialize(identifier:,
                   engine: nil,
                   cutter: nil,
                   filters: []
    )
      raise(ArgumentError, "identifier must be a Symbol") unless identifier.is_a?(Symbol)
      raise(ArgumentError, "engine #{engine} is not a Skeevy Engine!") unless engine.is_a?(Skeevy::Engine) || engine.nil?
      raise(ArgumentError, "cutter #{cutter} is not a Skeevy Cutter!") unless cutter.is_a?(Skeevy::Cutter) || cutter.nil?
      raise(ArgumentError, "filters must be an array") unless filters.is_a?(Array)
      @cutter = cutter || Skeevy::Cutters::StandardKey.new(instance: self)
      @engine = engine || Skeevy::Engines::SymbolicHash.new(instance: self)
      @filters = filters
      @cutter.instance ||= self
      @engine.instance ||= self
      @identifier = identifier
    end

    def object_key(hash:, ns:, object:)
      @cutter.cut(hash: hash, ns: ns, object: object)
    end

    def container_key(hash:, ns:)
      @cutter.cut(hash: hash, ns: ns, object: nil)
    end

    def read(key:)
      content = @engine.read(key: key)
      @filters.reverse.each do |f|
        content = f.filter_read(content: content)
      end
      content
    end

    def write!(key:, content:)
      @filters.each do |f|
        content = f.filter_write(content: content)
      end
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

    def add_filter(filter:)
      @filters << filter
    end
  end
end