# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-02-input.txt", __FILE__)
input = File.read(file_path)

RED = 12
GREEN = 13
BLUE = 14

sum = input.each_line.sum {
  red = _1.scan(/(\d+) r/).flatten.map(&:to_i).max
  green = _1.scan(/(\d+) g/).flatten.map(&:to_i).max
  blue = _1.scan(/(\d+) b/).flatten.map(&:to_i).max

  if red > RED || green > GREEN || blue > BLUE
    0
  else
    _1.scan(/Game (\d*)/).flatten.first.to_i
  end
}

puts("########## Day 2 2023 ##########")
puts("Part one solution: #{sum}")
puts("################################")
