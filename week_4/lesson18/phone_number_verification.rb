# frozen_string_literal: true
pattern = /\A(\+)?([- ()]?\d[- ()]?){10,14}\z/
puts "Введите номер телефона:"

user_input = STDIN.gets.chomp

is_phone_number = pattern.match?(user_input)

if is_phone_number
  puts "Спасибо!"
else
  puts "Это не номер телефона"
end
