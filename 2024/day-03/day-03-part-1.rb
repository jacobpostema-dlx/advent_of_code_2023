# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-03-input.txt", __FILE__)
input = File.read(file_path)

def mul_sum(mul_list)
  mul_list.map { |mul| mul.scan(/\d{1,3}/).map(&:to_i).reduce(:*) }.sum
end

mul_list = input.scan(/mul\(\d{1,3},\d{1,3}\)/)


puts("########## Day 03 2024 ##########")
puts("Part one solution: #{mul_sum(mul_list)}")
# to show online solution
# puts("Part one solution: #{File.read(file_path).scan(/mul\(\d{1,3},\d{1,3}\)/).map { |mul| mul.scan(/\d{1,3}/).map(&:to_i).reduce(:*) }.sum}")
puts("################################")
