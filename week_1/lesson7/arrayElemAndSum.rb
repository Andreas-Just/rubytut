array = []
idx = 0
sum = 0

puts 'Введите число больше нуля'
number = gets.to_i

while idx < number
  idx += 1
  array << idx
  sum += idx
end

puts array.to_s
puts "Сумма чисел: #{sum}"
