# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-01-test_input.txt", __FILE__)
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
  count = @list1.size
  count.times do
    @sum = @sum + distance(@list1.min, @list2.min)
    @list1.delete(@list1.min)
    @list2.delete(@list2.min)
  end
end

create_lists(input)
main
puts("########## Day 01 2024 ##########")
puts("Part one solution: #{@sum}")
puts("################################")
