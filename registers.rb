module TIS100
  class Register
    attr_reader :val

    def initialize
      @val = 0
    end
  end

  class Acc < Register
    def initialize
      super
    end

    def val=(new_val)
      @val = new_val
    end

    def name
      'ACC'
    end
  end

  class Bak < Register
    def initialize
      super
    end

    def val=(new_val)
      raise "Cannot read or write to BAK. Use SAVE or SWP instead."
    end

    def name
      'BAK'
    end
  end

  class Nil < Register
    def name
      'NIL'
    end
  end
end