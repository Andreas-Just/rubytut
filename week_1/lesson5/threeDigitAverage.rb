puts 'Введите число 1:'
first_number = gets

puts 'Введите число 2:'
second_number = gets

puts 'Введите число 3:'
third_number = gets

average = (first_number.to_f + second_number.to_f + third_number.to_f) / 3

puts 'Первое число: ' + first_number.to_s
puts 'Второе число: ' + second_number.to_s
puts 'Третье число: ' + third_number.to_s
puts 'Среднее: ' + average.round(1).to_s
