# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-04-test_input.txt", __FILE__)
input = File.readlines(file_path)

horizontal_xmas = input.map { |row| row.scan(/XMAS|SAMX/) }.flatten.compact
vertical_xmas = input.map(&:chars).transpose.map(&:join).map { |row| row.scan(/XMAS|SAMX/) }.flatten.compact


puts("########## Day 03 2024 ##########")
puts("Part one solution: #{horizontal_xmas.count + vertical_xmas.count}")
puts("################################")
