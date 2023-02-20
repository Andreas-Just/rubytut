# frozen_string_literal: true
require_relative "lib/file_reader"
require_relative "lib/question"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)
folder_path = "#{current_path}/data"
file_name = "question_*.txt"
number_questions = 3
current_question_number = 0

questions = FileReader.
  new(folder_path, file_name, Question).
  run.
  sample(number_questions)
quiz = Quiz.new(questions, number_questions)

until quiz.over?(current_question_number)
  quiz.current_step(current_question_number)

  puts quiz.current_question

  user_answer = gets.chomp.strip.downcase

  if quiz.answer_correct?(user_answer)
    quiz.score_up
  else
    quiz.correct_answer
  end

  current_question_number += 1
end

quiz.summarize
