# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-06-input.txt", __FILE__)
input = File.read(file_path).split("\n")
width = input.size
height = input[0].size
grid = {}
coords = []
start = Complex(0,0)
DIR = { "^" => 0-1i, "v" => 0+1i, "<" => -1+0i, ">" => 1+0i }
TURN = { "^" => ">", ">" => "v", "v" => "<", "<" => "^" }

width.times do |x|
  height.times do |y|
    grid[Complex(x,y)] = input[y][x]
    coords << Complex(x,y)
    start = Complex(x,y) if input[y][x] == ?^
  end
end

def path_finding(grid, pos)
  visited = Set.new
  char = grid[pos]

  while grid[pos] != nil
    visited << pos
    next_pos = pos + DIR[char]
    puts next_pos.inspect
    while grid[next_pos] == ?#
      char = TURN[char]
      next_pos = pos + DIR[char]
    end

    pos = next_pos
  end
  puts visited.inspect
  visited
end


puts("########## Day 06 2024 ##########")
puts("Part one solution: #{path_finding(grid, start).size}")
puts("################################")
