module TIS100
  module Instructions
    def nop
    end

    def mov(val, to)
      to.val = val
      if @debugging
        puts "#{to.name}: #{to.val}"
      end
    end

    def swp
    end

    def sav
    end

    def add
    end

    def sub
    end

    def neg
    end

    def jmp
    end

    def jez
    end

    def jnz
    end

    def jgz
    end

    def jlz
    end

    def jro
    end
  end
end