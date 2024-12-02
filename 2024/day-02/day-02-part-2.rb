# frozen_string_literal: true
#!/usr/bin/env ruby

file_path = File.expand_path("../day-02-input.txt", __FILE__)
input = File.readlines(file_path)

def safe?(input)
  report_line = input.each_cons(2).map { |first, second| (first - second) }
  if report_line.all? { |x| x.positive? } || report_line.all? { |x| x.negative? }
    return report_line.all? { |x| x.abs <= 3 }
  end
  false
end

def problem_dampener(report_line)
  0..report_line.length.times do |i|
    report_copy = report_line.dup
    report_copy.delete_at(i)
    return true if safe?(report_copy)
  end
  false
end

safe_reports = 0
input.each do |line|
  report_line = line.split.map(&:to_i)
  if safe?(report_line)
    safe_reports += 1
  else
    safe_reports += 1 if problem_dampener(report_line)
  end
end

puts("########## Day 02 2024 ##########")
puts("Part two solution: #{safe_reports}")
puts("################################")
