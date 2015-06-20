require_relative 'node'

TIS100::Node.new do
  debug true

  mov 10, acc
  mov 100, acc
  sub 10, acc
  sub 100, acc
  add 1000, acc
  mov 10, bak
end
