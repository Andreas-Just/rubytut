# frozen_string_literal: true

require_relative 'lib/film'
require_relative 'methods'

current_path = File.dirname(__FILE__)

films = Dir[File.join(current_path, 'data', '*.txt')].map do |file_name|
  film_from_file(file_name)
end

directors = films.map(&:director).uniq

puts 'Программа «Фильм на вечер»'
puts 'Фильм какого режиссёра вам предложить?'

directors.each.with_index(1) do |director, id|
  puts "#{id}. #{director}"
end

until (user_choice = $stdin.gets.to_i).between?(1, directors.size)
  puts 'Выберите номер из предложенных вариантов'
end

selected_director = directors[user_choice - 1]

puts 'И сегодня вечером рекомендую посмотреть:'
puts films.select { |film| film.director == selected_director }.sample
