require_relative 'instructions'
require_relative 'ports'
require_relative 'registers'

module TIS100
  # In TIS-100, each node is essentially a concurrently running CPU w/it's own set of registers
  # and ports that it can communicate w/other nodes on

  class Node
    include Instructions

    def initialize
      # Registers
      @acc   =  Acc.new
      @bak   =  Bak.new
      @nil   =  Nil.new

      # Ports
      @left  =  Port.new
      @right =  Port.new
      @up    =  Port.new
      @down  =  Port.new
    end
  end
end