array = []
idx = 0
max = 0

puts 'Какой длины будет массив случайных чисел?'
number = gets.to_i

while idx < number
  array << rand(101)
  idx += 1
end

array.each { |num|
  if max < num
    max = num
  end
}

puts array.to_s
puts "Самое большое число: #{max}"
