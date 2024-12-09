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

dir = [0+1i, 0-1i, 1+0i, -1+0i, 1+1i, 1-1i, -1+1i, -1-1i]

pattern = dir.map{ |d| (0..3).to_a.map{|e| e * d}}

sum = coords
  .map{ |c| pattern.map{ |p| p.map{|q| c + q}} }
  .sum{ |a| a.count{ |z| z.map{ |c| grid[c]} == %w{X M A S}}}

# rotating to get everything but a solution i'll look at later
# horizontal_xmas = input.map { |row| row.scan(/XMAS|SAMX/) }.flatten.compact
# vertical_xmas = input.map(&:chars).transpose.map(&:join).map { |row| row.scan(/XMAS|SAMX/) }.flatten.compact
# puts("Part one solution: #{horizontal_xmas.count + vertical_xmas.count}")

puts("########## Day 04 2024 ##########")
puts("Part one solution: #{sum}")
puts("################################")
