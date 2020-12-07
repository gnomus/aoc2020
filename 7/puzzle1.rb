INPUTS = File.readlines('input')

def give_parents(variant, color)
  INPUTS.filter do |rule|
    rule.match?(/[1-9] #{variant} #{color} bag/)
  end.map do |rule|
    rule.split(' ')[0..1]
  end
end

def count_leaves(variant, color)
  parents = give_parents(variant, color)
  parents + parents.map do |parent|
    count_leaves(parent[0], parent[1])
  end.flatten(1)
end

puts count_leaves('shiny', 'gold').uniq.count
