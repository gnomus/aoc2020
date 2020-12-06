inputs = File.readlines('input')

puts inputs.count

inputs.map! do |line|
  line.split(/(-|\s|:\s)/)
end

inputs.filter! do |l|
  count = l[6].count(l[4])

  count >= l[0].to_i && count <= l[2].to_i
end

inputs.map! do |line|
  line.join
end

puts inputs

puts inputs.count
