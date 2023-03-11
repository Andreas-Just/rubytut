# frozen_string_literal: true
pattern = /(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?/
puts "Введите номер телефона:"

user_input = STDIN.gets.chomp

is_phone_number = pattern.match?(user_input)

if is_phone_number
  puts "Спасибо!"
else
  puts "Это не номер телефона"
end
