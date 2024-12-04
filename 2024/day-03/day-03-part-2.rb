# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-03-input.txt", __FILE__)
input = File.read(file_path)

def mul_sum(mul_list)
  mul_list.map { |mul| mul.scan(/\d{1,3}/).map(&:to_i).reduce(:*) }.sum
end

parsed_input = input.lines("do()").map {|mul| mul.lines("don't()")}.flatten

enable = true
mul_list = []
parsed_input.each do |section|
  if enable
    enable = false if section.include?("don't()")
    mul_list << section.scan(/mul\(\d{1,3},\d{1,3}\)/)
  else
    enable = true if section.include?("do()")
    next
  end
end

puts("########## Day 03 2024 ##########")
puts("Part two solution: #{mul_sum(mul_list.flatten)}")
puts("################################")
