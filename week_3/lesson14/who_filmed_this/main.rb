require_relative "lib/film"
require_relative "lib/quiz"
require_relative "lib/console_interface"

number_questions = 3
films =
  Dir[File.join(__dir__, 'data', '*.txt')].map do |file_name|
    title, director, year  = File.readlines(file_name, chomp: true)
    Film.new(title, director, year)
  end

quiz = Quiz.new(films, number_questions)
quiz.run
console_interface = ConsoleInterface.new(quiz, number_questions)

puts "Добрый день, любитель кино!"
puts "Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?"

number_questions.times do | number|
  console_interface.print_question(number)
  director = console_interface.get_input
  quiz.play!(director, number)
  console_interface.print_answer
end

console_interface.print_victory

# directors.each.with_index(1) do |director, id|
#   puts "#{id}. #{director}"
# end

# until (user_choice = $stdin.gets.to_i).between?(1, directors.size)
#   puts 'Выберите номер из предложенных вариантов'
# end
#
# selected_director = directors[user_choice - 1]
#
# puts "И сегодня вечером рекомендую посмотреть:"
# puts films.select { |film| film.director == selected_director }.sample
