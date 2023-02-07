# frozen_string_literal: true

p 'Введите слово:'

word = gets.chomp

while word == '' do
  p 'Строка не может быть пустой'
  word = gets.chomp
end

p word.chars.to_a.shuffle.join.downcase
