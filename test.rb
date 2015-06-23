require_relative 'node'

# TIS100::Node.new do
#   debug false

#   start do
#     mov 10, acc
#     mov 100, acc
#     sub 10, acc
#     sub 100, acc
#     add 1000, acc
#     state
#     neg
#     state
#     jmp :finish
#   end

#   finish do
#     mov 1337, acc
#     sav
#     state
#   end

#   # state
#   # swp
#   # state
#   # sav
#   # state
# end

require_relative 'parsing/parser'
str = <<-EOS
START:
  MOV 10 ACC
  SUB 10
  MOV ACC DOWN
  JMP FINISH
FINISH:
  SAV
  SWP
EOS
Parser.parse(str)