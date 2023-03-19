# frozen_string_literal: true
require 'set'

VOWELS = %w| a e i o u |
CONSONANTS = ('a'..'z').to_a.join.delete(VOWELS.join).chars
def count_vowels(str)
  str.count(VOWELS.join)
end
def count_consonants(str)
  str.each_char.count { |c| CONSONANTS.to_set.include?(c) }
end

puts "Введите слово:"
user_word = gets.chomp

puts "Гласных: #{count_vowels(user_word)}"
puts "Согласных: #{count_consonants(user_word)}"
