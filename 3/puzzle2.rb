inputs = File.readlines('input')

MAP = inputs.map do |row|
  splitted = row.split('')
  splitted.pop # remove newlines
  splitted
end

HEIGHT = MAP.count
WIDTH = MAP[0].count


def count_trees_recursive(count, pos, steps)
  nextpos = pos.zip(steps).map(&:sum)
  puts "Arrived at: #{pos} with #{count} Trees"

  # Horizontal overflow
  pos[0] = pos[0] % WIDTH

  if pos[1] >= HEIGHT
    puts "Done at #{pos}, Count: #{count}"
    return count
  else
    if MAP[pos[1]][pos[0]] == '#'
      count_trees_recursive(count+1, nextpos, steps)
    else
      count_trees_recursive(count, nextpos, steps)
    end
  end
end

slope11 = count_trees_recursive(0, [0,0], [1,1])
slope31 = count_trees_recursive(0, [0,0], [3,1])
slope51 = count_trees_recursive(0, [0,0], [5,1])
slope71 = count_trees_recursive(0, [0,0], [7,1])
slope12 = count_trees_recursive(0, [0,0], [1,2])

puts "Slope11: #{slope11}"
puts "Slope31: #{slope31}"
puts "Slope51: #{slope51}"
puts "Slope71: #{slope71}"
puts "Slope12: #{slope12}"

puts "Result: #{slope11 * slope31 * slope51 * slope71 * slope12}"
