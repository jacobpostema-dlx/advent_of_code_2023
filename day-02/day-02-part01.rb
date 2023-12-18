# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-02-input.txt", __FILE__)
input = File.readlines(file_path)

cal = input.sum {_1.scan(/[\d]/).values_at(0, -1).join.to_i}

puts("########## Day 1 2023 ##########")
puts("Part one solution: #{cal}")
puts("################################")
