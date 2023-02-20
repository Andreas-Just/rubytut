require_relative 'lib/film'

films =
  Dir[File.join(__dir__, 'data', '*.txt')].map do |file_name|
    lines = File.readlines(file_name, chomp: true)
    Film.new(lines[0], lines[1], lines[2].to_i)
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

puts "И сегодня вечером рекомендую посмотреть:"
puts films.select { |film| film.director == selected_director }.sample
