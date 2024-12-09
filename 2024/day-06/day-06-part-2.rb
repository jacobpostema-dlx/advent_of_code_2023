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

def path_finding(grid, pos, obstruction = nil)
  visited = Set.new
  char = grid[pos]

  while grid[pos] != nil
    return false if visited.include?([pos, char])

    visited << [pos, char]
    next_pos = pos + DIR[char]
    while grid[next_pos] == ?# || next_pos == obstruction
      char = TURN[char]
      next_pos = pos + DIR[char]
    end

    pos = next_pos
  end
  visited.map(&:first).uniq
end

sum = path_finding(grid, start.dup).count do |test_pos|
  next false if test_pos == start
  path_finding(grid, start, test_pos) == false
end

puts("########## Day 06 2024 ##########")
puts("Part two solution: #{sum}")
puts("################################")
