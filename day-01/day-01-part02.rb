# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-01-test02.txt", __FILE__)
input = File.readlines(file_path)

regex =
cal = input.sum { _1.scan(/[\d]/).values_at(0, -1).join.to_i }

def spelled_out(input)
end

puts("########## Day 1 2023 ##########")
puts("Part two solution: #{cal}")
puts("################################")
