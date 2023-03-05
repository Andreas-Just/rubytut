# frozen_string_literal: true
require_relative "lib/film"

current_path = File.dirname(__FILE__)

QUESTIONS_COUNT = 3
OPTIONS_COUNT = 4

films =
  Dir[File.join(current_path, "data", "*.txt")].map do |name|
    title, director, year = File.readlines(name, chomp: true)
    Film.new(title, director, year)
  end

films_for_quiz = films.sample(QUESTIONS_COUNT)
all_directors = films.map(&:director).uniq

total_correct_answers = 0

films_for_quiz.each.with_index(1) do | film, number |

  director_options = all_directors.grep_v(film.director).sample(OPTIONS_COUNT - 1)
  director_options << film.director
  director_options.shuffle!

  puts <<~CURRENT_QUIZ_STATUS
    Вопрос #{number + 1}:
    Кто снял «#{film.title}» (#{film.year})
    #{director_options.map.with_index(1) { |director, i| "#{i}. #{director}"}.join("\n")}
  CURRENT_QUIZ_STATUS


  until (user_choice = $stdin.gets.to_i).between?(1, director_options.size)
    puts 'Выберите номер из предложенных вариантов'
  end

  if film.director == director_options[user_choice - 1]
    total_correct_answers += 1
    puts "Верно!"
  else
    puts "Неправильно! Правильный ответ: #{film.director}"
  end
end

puts "Вы угадали #{total_correct_answers} из #{films_for_quiz.size} режиссеров"
