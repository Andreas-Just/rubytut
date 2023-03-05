# frozen_string_literal: true
require_relative "lib/question"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)

questions =
  Dir[File.join(current_path, "data", "question_*.txt")].map do |name|
    question, answer, points = File.readlines(name, chomp: true)
    Question.new(question, answer, points)
  end

quiz = Quiz.new(questions)

until quiz.over?
  puts quiz.current_question

  user_answer = gets.chomp.strip.downcase

  if quiz.answer_correct?(user_answer)
    puts quiz.score_up!
  else
    puts quiz.correct_answer
  end

  quiz.next_question!
end

puts quiz.summarize
