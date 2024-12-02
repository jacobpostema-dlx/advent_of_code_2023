# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-02-input.txt", __FILE__)
input = File.readlines(file_path)

def safe?(input)
  line = input.split.map(&:to_i)
  report_lines = line.each_cons(2).map {|first, second| (first - second) }
  puts report_lines.inspect
  puts report_lines.all? { |x| x.positive? } || report_lines.all? { |x| x.negative? }
  if report_lines.all? { |x| x.positive? } || report_lines.all? { |x| x.negative? }
    return report_lines.all? { |x| x.abs <= 3 }
  end
  return false
end

safe_reports = 0
input.each do |line|
  safe_reports += 1 if safe?(line)
end

puts("########## Day 02 2024 ##########")
puts("Part one solution: #{safe_reports}")
puts("################################")
