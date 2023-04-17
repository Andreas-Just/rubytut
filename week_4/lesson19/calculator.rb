# frozen_string_literal: true
puts 'Первое число:'
number1 = $stdin.gets.to_i
puts 'Второе число:'
number2 = $stdin.gets.to_i

puts 'Выберите операцию (+ - * /)'
operation = $stdin.gets.chomp

puts 'Результат:'
case operation
when '+'
  puts number1 + number2
when '-'
  puts number1 - number2
when '*'
  puts number1 * number2
when '/'
  begin
    puts number1 / number2
  rescue ZeroDivisionError
    puts 'На ноль делить нельзя'
  end
else
  puts 'Нет такой операции'
end
