require_relative 'node'

TIS100::Node.new do
  debug true

  mov 10, acc
  mov 100, acc
end
