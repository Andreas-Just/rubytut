# frozen_string_literal: true
require_relative "lib/file_reader"
require_relative "lib/film"
require_relative "lib/question"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)
folder_path = "data"
file_name = "*.txt"
number_questions = 5
current_question_number = 0

films = FileReader.new(current_path, folder_path, file_name, Film).run

questions = Question.new(films, number_questions).run
quiz = Quiz.new(questions, number_questions)

until quiz.over?(current_question_number)
  quiz.current_step(current_question_number)

  puts <<~CURRENT_QUIZ_STATUS
      Вопрос #{current_question_number + 1}:
      Кто снял «#{quiz.title}» (#{quiz.year})
      #{quiz.director_options.map.with_index(1) { |director, idx| "#{idx}. #{director}"}.join("\n")}
  CURRENT_QUIZ_STATUS

  until (user_choice = $stdin.gets.to_i).between?(1, quiz.director_options.size)
    puts 'Выберите номер из предложенных вариантов'
  end

  if quiz.answer_correct?(user_choice)
    puts quiz.score_up
  else
    puts quiz.correct_answer
  end

  current_question_number += 1
end

puts quiz.summarize

