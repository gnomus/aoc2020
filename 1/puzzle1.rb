inputs = File.readlines('input').map{ |i| i.to_i }

inputs2 = inputs.clone

product = inputs.product(inputs2)

product.select! do |i|
  i.sum == 2020
end

puts "#{product.first} = #{product.first[0] * product.first[1]}"
