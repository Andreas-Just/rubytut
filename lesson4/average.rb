array = [2308, 13]

average = array.reduce(0, :+) / array.length

puts 'Average: ' + average.to_s
puts
puts 'Sum of numbers from 1 to 100: ' + (1..100).reduce(0, :+).to_s

