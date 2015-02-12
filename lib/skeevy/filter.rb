module Skeevy
  module Filter
    def filter_write(content: )
      raise NoMethodError, "Your Filter is missing .filter_write"
    end

    def filter_read(content: )
      raise NoMethodError, "Your Filter is missing filter_read"
    end
  end
end