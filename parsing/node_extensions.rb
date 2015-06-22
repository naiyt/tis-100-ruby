# http://thingsaaronmade.com/blog/a-quick-intro-to-writing-a-parser-using-treetop.html

module Tis
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      self.text_value.to_i
    end
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      eval self.text_value
    end
  end

  class Identifier < Treetop::Runtime::SyntaxNode
    def to_array
      text_value.strip
    end
  end

  class Expression < Treetop::Runtime::SyntaxNode
    def to_array
      elements[0].to_array
    end
  end

  class Body < Treetop::Runtime::SyntaxNode
    def to_array
      elements.map {|x| x.to_array}
    end
  end

  class Instruction < Treetop::Runtime::SyntaxNode
    def to_array
      text_value.strip
    end
  end
end