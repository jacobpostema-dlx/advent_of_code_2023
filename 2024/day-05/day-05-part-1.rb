# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-05-input.txt", __FILE__)
input = File.read(file_path)

rules = Hash.new { |h, k| h[k] = Set.new }
input.scan(/(\d+)\|(\d+)/) { rules[$1.to_i] << $2.to_i }
page_updates = input[/(?<=\n\n).*/m].lines.map { _1.scan(/\d+/).map(&:to_i) }

correct = page_updates.filter do |update|
  update.map.with_index.all? do |page, i|
    update[0...i].none? { |before| rules[page].include?(before) }
  end
end


puts("########## Day 05 2024 ##########")
puts("Part one solution: #{correct.sum {_1[_1.length/2]}}")
puts("################################")

