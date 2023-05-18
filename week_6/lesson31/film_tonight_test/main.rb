# frozen_string_literal: true

require_relative 'lib/film'

films = Dir[File.join(File.dirname(__FILE__), 'data', '*.txt')].map do |file_name|
  Film.from_file(file_name)
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
