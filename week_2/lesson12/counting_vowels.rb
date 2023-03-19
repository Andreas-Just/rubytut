# frozen_string_literal: true
require 'set'

SET_OF_VOWELS = %w| a e i o u |.to_set
def count_vowels(str)
  h = str.each_char.with_object(Hash.new(0)) { |c,h| h[c] += 1 }
  SET_OF_VOWELS.sum { |c| h[c] }
end

puts "Введите слово:"
user_word = gets.chomp

puts "Гласных: #{count_vowels(user_word)}"
