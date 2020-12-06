inputs = File.readlines('input').map{ |i| i.to_i }

inputs2 = inputs.clone

product = inputs.product(inputs,inputs)

product.select! do |i|
  i.sum == 2020
end

puts "#{product.first} = #{product.first.inject :*}"
