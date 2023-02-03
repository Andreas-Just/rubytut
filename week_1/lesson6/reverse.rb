numbers = [1, 2, 3, 4, 5]

puts 'Каждое число массива в обратном порядке:'
numbers.reverse_each { |num| puts num }
puts 'Массив в обратном порядке: ' + numbers.reverse.to_s
puts 'Исходный массив (не изменился): ' + numbers.to_s
numbers.reverse!
puts 'Исходный массив (после изменения): ' + numbers.to_s
