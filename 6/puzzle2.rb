inputs = File.readlines('input')

answers = inputs.chunk do |line|
  line == "\n"
end.map do |emptyline, answers|
  answers.map { |a| a.strip.chars.to_a }
end.map do |answers|
  first = answers.first
  answers[1..].each do |answer|
    first.filter! { |x| answer.include?(x) }
  end
  first.count
end

puts answers.sum
