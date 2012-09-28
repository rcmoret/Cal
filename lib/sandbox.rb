my_array = (1..12).to_a

my_array.each do |i|
  puts "this is the #{i} value of the array"
end

doubles = Hash.new

my_array.each do |i|
  k = i * 3
  doubles[i] = k
end

doubles.sort.each do |key, value|
  puts "#{key} times 3 will equal #{value}"
end