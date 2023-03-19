# frozen_string_literal: true
puts 'Напишите фразу для проверки на палиндромность.'

phrasing = nil

while phrasing == '' || phrasing.nil? do
  phrasing = gets.chomp
end

phrasing_with_punctuation_marks_and_spaces = phrasing.strip
phrasing_without_punctuation_marks_and_spaces = phrasing_with_punctuation_marks_and_spaces.delete " ()[]{}*!?.,:;–—#-"
palindrome = phrasing_without_punctuation_marks_and_spaces.downcase
result = palindrome == palindrome.reverse

if result
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end
