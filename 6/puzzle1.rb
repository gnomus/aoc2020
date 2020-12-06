inputs = File.readlines('input')

answers = inputs.chunk do |line|
  line == "\n"
end.map do |emptyline, answers|
  answers.map(&:strip).join.chars.to_a.uniq.count
end

puts answers.sum
