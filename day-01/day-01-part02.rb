# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-01-input.txt", __FILE__)
input = File.readlines(file_path)

DIGITS = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
cal = input.sum {
  _1.scan(/(?=(#{DIGITS.keys.join("|")}|\d))/)
    .flatten.values_at(0, -1)
    .map { |match| DIGITS[match.to_sym] || match }.join.to_i
}

puts("########## Day 1 2023 ##########")
puts("Part two solution: #{cal}")
puts("################################")
