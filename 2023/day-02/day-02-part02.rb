# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-02-input.txt", __FILE__)
input = File.read(file_path)

sum = input.each_line.sum {
  red = _1.scan(/(\d+) r/).flatten.map(&:to_i).max
  green = _1.scan(/(\d+) g/).flatten.map(&:to_i).max
  blue = _1.scan(/(\d+) b/).flatten.map(&:to_i).max

  red * green * blue
}


puts("########## Day 2 2023 ##########")
puts("Part two solution: #{sum}")
puts("################################")
