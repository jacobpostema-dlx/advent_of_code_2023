# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-03-input.txt", __FILE__)
input = File.read(file_path)

gears = {}
numbers = {}

lines = input.each_line.to_a.map(&:strip)
lines.each_with_index do |line, y|
  line.scan(/\*/) do
    gears[[Regexp.last_match.begin(0), y]] = []
  end

  line.scan(/\d+/) do
    numbers[[Regexp.last_match.begin(0), y]] = _1
  end
end

numbers.each { |(x, y), num|
  min_x = [x - 1, 0].max
  min_y = [y - 1, 0].max

  max_x = x + num.length
  max_y = y + 1

  (min_x..max_x).to_a.product((min_y..max_y).to_a).select { gears[_1] }.each { gears[_1] << num.to_i }
}

sum = gears.values.select { _1.count == 2 }.sum {_1.inject(:*) }

puts("########## Day 2 2023 ##########")
puts("Part two solution: #{sum}")
puts("################################")
