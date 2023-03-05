# frozen_string_literal: true
require_relative "lib/film"

current_path = File.dirname(__FILE__)
folder_name = "data"
file_name = "*.txt"
folder_path = "#{current_path}/#{folder_name}"
number_questions = 5
number_options = 4
total_correct_answers = 0
films_surveyed = []

puts "Папка не найдена" unless Dir.exist?("#{current_path}/#{folder_path}")

films =
  Dir[File.join(current_path, folder_name, file_name)].map do |name|
    title, director, year = File.readlines(name, chomp: true)
    Film.new(title, director, year)
  end

number_questions.times do | number |
  current_film = films.sample

  while films_surveyed.include?(current_film.title)
    current_film = films.sample
  end

  films_surveyed.push(current_film.title)

  director_options =
    films.
      uniq(&:director).
      sample(number_options).
      each_with_object([current_film.director]) { | film, option |
        option << film.director if film.director != current_film.director && option.size < number_options
      }.shuffle

  puts <<~CURRENT_QUIZ_STATUS
    Вопрос #{number + 1}:
    Кто снял «#{current_film.title}» (#{current_film.year})
    #{director_options.map.with_index(1) { |director, idx| "#{idx}. #{director}"}.join("\n")}
  CURRENT_QUIZ_STATUS


  until (user_choice = $stdin.gets.to_i).between?(1, number_options)
    puts 'Выберите номер из предложенных вариантов'
  end

  if current_film.director == director_options[user_choice - 1]
    total_correct_answers += 1
    puts "Верно!"
  else
    puts "Неправильно! Правильный ответ: #{current_film.director}"
  end
end

puts "Вы угадали #{total_correct_answers} из #{number_questions} режиссеров"
