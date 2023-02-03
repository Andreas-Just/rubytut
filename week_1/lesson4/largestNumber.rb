num1, num2 = 172.169, 31.514
puts num1, num2.class.name

is_first_number_larger = num1 <=> num2
puts is_first_number_larger.class.name

if is_first_number_larger == 1
  puts 'Наибольшее число: ' + num1.to_s
end

if is_first_number_larger == -1
  puts 'Наибольшее число: ' + num2.to_s
end

if is_first_number_larger == 0
  puts 'Оба числа равны'
end


