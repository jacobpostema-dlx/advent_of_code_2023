# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-$-input.txt", __FILE__)
input = File.read(file_path).split("\n")
width = input.size
height = input[0].size
grid = {}
coords = []
start = Complex(0,0)

width.times do |x|
  height.times do |y|
    grid[Complex(x,y)] = input[y][x]
    coords << Complex(x,y)
    start = Complex(x,y) if input[y][x] == ?^
  end
end


puts("########## Day 06 2024 ##########")
puts("Part one solution: #{sum}")
puts("################################")
