# frozen_string_literal: true

p 'Введите слово:'

word = gets.chomp

while word == '' do
  p 'Строка не может быть пустой'
  word = gets.chomp
end

p word.gsub(/\b([\p{L}])([\p{L}]+)([\p{L}])\b/) { $3.insert(0, $1 + $2.split('').shuffle.join) }
