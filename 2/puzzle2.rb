inputs = File.readlines('input')

puts inputs.count

inputs.map! do |line|
  line.split(/(-|\s|:\s)/)
end


inputs.filter! do |l|
  char1 = l[6][l[0].to_i-1]
  char2 = l[6][l[2].to_i-1]

  (cchar1 == l[4]) ^ (char2 == l[4])
end

inputs.map! do |line|
  line.join
end

puts inputs

puts inputs.count
