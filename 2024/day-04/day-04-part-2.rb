# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-04-input.txt", __FILE__)
input = File.read(file_path).split("\n")
width = input.size
height = input[0].size
grid = {}
coords = []

width.times do |x|
  height.times do |y|
    grid[Complex(x,y)] = input[y][x]
    coords << Complex(x,y)
  end
end

MATCH = [%w{M S}, %w{S M}]

sum = coords.count{ |c| grid[c] == ?A && MATCH.include?([grid[c+(-1-1i)], grid[c+(1+1i)]]) && MATCH.include?([grid[c+(-1+1i)], grid[c+(1-1i)]])}


puts("########## Day 03 2024 ##########")
puts("Part one solution: #{sum}")
puts("################################")
