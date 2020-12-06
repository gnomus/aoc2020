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
  else
    if MAP[pos[1]][pos[0]] == '#'
      count_trees_recursive(count+1, nextpos, steps)
    else
      count_trees_recursive(count, nextpos, steps)
    end
  end
end

count_trees_recursive(0, [0,0], [3,1])
