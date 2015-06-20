module TIS100
  module Instructions
    def nop
    end

    def mov(val, dest)
      dest.val = val
      puts debug_message(dest) if @debugging
    end

    def swp
    end

    def sav
    end

    def add(val, dest)
      dest + val
      puts debug_message(dest) if @debugging
    end

    def sub(val, dest)
      dest - val
      puts debug_message(dest) if @debugging
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

    def debug_message(dest)
      print "#{dest.name}: #{dest.val}"
    end
  end
end