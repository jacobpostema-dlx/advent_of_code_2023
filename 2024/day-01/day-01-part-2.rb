# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-01-input.txt", __FILE__)
input = File.readlines(file_path)
@list1 = []
@list2 = []
@sum = 0

def create_lists(input)
  input.each do |line|
    row = line.split
    @list1 << row[0].to_i
    @list2 << row[1].to_i
  end
end

def distance(x, y)
  (x - y).abs
end

def main
  apperances = @list2.tally
  @list1.each do |id|
    @sum = @sum + (id * apperances[id].to_i)
  end
end

create_lists(input)
main
puts("########## Day 01 2024 ##########")
puts("Part two solution: #{@sum}")
puts("################################")
