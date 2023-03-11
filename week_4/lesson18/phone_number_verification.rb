# frozen_string_literal: true
pattern = /^(\+)?([- ()]?\d[- ()]?){10,14}$/
puts "Введите номер телефона:"

user_input = STDIN.gets.chomp

is_phone_number = pattern.match?(user_input)

if is_phone_number
  puts "Спасибо!"
else
  puts "Это не номер телефона"
end
