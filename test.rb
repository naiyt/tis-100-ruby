require_relative 'node'

TIS100::Node.new do
  debug false

  mov 10, acc
  mov 100, acc
  sub 10, acc
  sub 100, acc
  add 1000, acc
  state
  swp
  state
  sav
  state
end
