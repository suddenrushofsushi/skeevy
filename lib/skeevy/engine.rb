module Skeevy
  module Engine

    attr_accessor :instance

    def read(key:)
      raise NoMethodError, "Your Engine is missing .read"
    end

    def write!(key:, content:)
      raise NoMethodError, "Your Engine is missing .write!"
    end

    def exist?(key:)
      raise NoMethodError, "Your Engine is missing .exist?"
    end

    def delete!(key:)
      raise NoMethodError, "Your Engine is missing .delete!"
    end
  end
end
