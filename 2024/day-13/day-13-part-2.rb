# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-13-input.txt", __FILE__)
input = File.read(file_path).split("\n\n").map {_1.scan(/\d+/).map(&:to_i) }

def solver(ax, ay, bx, by, px, py)
  require 'z3'
  solve = Z3::Solver.new
  a = Z3::Int("a")
  b = Z3::Int("b")

  solve.assert(a>= 0)
  solve.assert(b>= 0)
  solve.assert(ax * a + bx * b == px)
  solve.assert(ay * a + by * b == py)

  return nil unless solve.satisfiable?

  [solve.model[a].to_i, solve.model[b].to_i]
end
button_presses = input.map { |ax, ay, bx, by, px, py| solver(ax, ay, bx, by, (px + 10000000000000), (py + 10000000000000)) }.compact

puts("########## Day 13 2024 ##########")
puts("Part two solution: #{button_presses.map {_1*3 + _2*1}.sum}")
puts("################################")
