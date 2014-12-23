module Skeevy
  module Engine

    attr_accessor :instance

    def read(id:, ns:, object:)
      raise NoMethodError, "Your Engine is missing .read"
    end

    def write!(id:, ns:, object:)
      raise NoMethodError, "Your Engine is missing .write!"
    end

    def exist?(id:, ns:, object:)
      raise NoMethodError, "Your Engine is missing .exist?"
    end

    def delete!(id:, ns:, object:)
      raise NoMethodError, "Your Engine is missing .delete!"
    end
  end
end
