INPUTS = File.readlines('input')

RULES = Hash.new

def gen_hash(variant, color)
  "#{variant}_#{color}".to_sym
end

def count_contents(hash)
  contents = RULES[hash].map do |c|
    c[0] * count_contents(c[1])
  end
  contents.sum + 1
end

INPUTS.each do |rule|
  parts = rule.split(' ', 5)
  hash = gen_hash(parts[0], parts[1])
  contents = parts[4].split(',')
  contents.filter! { |c| c != "no other bags.\n"}
  contents.map! do |c|
    c = c.split(' ')
    [c[0].to_i, gen_hash(c[1], c[2])]
  end
  RULES[hash] = contents
end

puts count_contents(:shiny_gold) - 1 # we already have to shiny gold one
