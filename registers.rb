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

    def +(val)
      @val += val
    end

    def -(val)
      @val -= val
    end

    def name
      'ACC'
    end
  end

  class Bak < Register
    WRITE_EXCEPTION = "Cannot read or write to BAK. Use SAV or SWP instead"

    def initialize
      super
    end

    def swp(register)
      register.val, @val = @val, register.val
    end

    def sav(register)
      @val = register.val
    end

    def val=(new_val)
      raise WRITE_EXCEPTION
    end

    def +(val)
      raise WRITE_EXCEPTION
    end

    def -(val)
      raise WRITE_EXCEPTION
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