require 'skeevy/version'
require 'skeevy/engine'
require 'skeevy/cutter'
require 'skeevy/cutters/standard_key'
require 'skeevy/engines/directory_file'
require 'skeevy/instance'

fail "Skeevy #{Skeevy::VERSION} requires Ruby 2.1 or later." if RUBY_VERSION < '2.1.0'

module Skeevy

  # Poor-man's singleton
  class << self
    def register!(identifier:, engine: nil, cutter: nil)
      raise(ArgumentError, "Identifier must be a symbol") unless identifier.is_a?(Symbol)
      @instances ||= {}
      @instances[identifier] = Instance.new identifier: identifier,
                                       engine: engine,
                                       cutter: cutter
    end

    def instance(identifier)
      raise(ArgumentError, "Identifier must be a symbol") unless identifier.is_a?(Symbol)
      @instances[identifier]
    end

    def [](identifier)
      instance(identifier)
    end

    def inspect
      "Skeevy #{Skeevy::VERSION}"
    end
  end

end