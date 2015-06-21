require 'treetop'
require_relative 'node_extensions.rb'

# http://thingsaaronmade.com/blog/a-quick-intro-to-writing-a-parser-using-treetop.html

class Parser
  Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), 'tis100_parser.treetop')))
  @@parser = TisParser.new

  def self.parse(data)

    tree = @@parser.parse(data)

    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end

    self.clean_tree(tree)
    tree
  end

  private

  def self.clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each {|node| self.clean_tree(node) }
  end

end

puts Parser.parse("START: MOV LEFT UP")