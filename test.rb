require_relative 'node'

TIS100::Node.new do
  debug false

  start do
    mov 10, acc
    mov 100, acc
    sub 10, acc
    sub 100, acc
    add 1000, acc
    state
    neg
    state
    jmp :finish
  end

  finish do
    mov 1337, acc
    sav
    state
  end

  # state
  # swp
  # state
  # sav
  # state
end
