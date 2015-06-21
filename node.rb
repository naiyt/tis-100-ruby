require_relative 'instructions'
require_relative 'ports'
require_relative 'registers'

module TIS100
  # In TIS-100, each node is essentially a concurrently running CPU w/it's own set of registers
  # and ports that it can communicate w/other nodes on

  class Node
    include Instructions
    attr_accessor :acc, :bak, :nil, :left, :right, :up, :down

    def initialize(&block)
      # Registers
      @acc   =  Acc.new
      @bak   =  Bak.new
      @nil   =  Nil.new

      # Ports
      @left  =  Port.new
      @right =  Port.new
      @up    =  Port.new
      @down  =  Port.new

      @debugging = false

      instance_eval(&block) if block_given?
    end

    def debug(state=false)
      @debugging = state
    end

    def state
      puts "ACC: #{acc.val}"
      puts "BAK: #{bak.val}"
    end

    private

    def method_missing(method_sym, &block)
      add_label(method_sym, block)
      if block_given?
        yield
      else
        @labels[method_sym].call
      end
    end

    def add_label(label_name, block)
      @labels ||= {}
      @labels[label_name] = block
    end
  end
end