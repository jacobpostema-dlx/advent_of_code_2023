# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-07-input.txt", __FILE__)
input = File.read(file_path).scan(/(\d+): (.*)/)

OPERATORS = %i[+ * concat]
calibration = input.map{ |r,n| [r.to_i, n.split.map(&:to_i)]}

module AoC
  refine Integer do
    def concat(other)
      (self.to_s + other.to_s).to_i
    end
  end
end
using AoC

def find_equations(solution, ops, values, partial)
  return false if partial > solution

  if values.size == 1
    ops.any? do |op|
      solution == partial.send(op, values[0])
    end
  else
    ops.any?{ |op| find_equations(solution, ops, values[1..], partial.send(op, values[0])) }
  end
end

puts("########## Day 07 2024 ##########")
puts("Part two solution: #{calibration.sum { |solution, values| find_equations(solution, OPERATORS, values[1..], values[0]) ? solution : 0 }}")
puts("################################")
