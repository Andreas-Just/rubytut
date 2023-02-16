# frozen_string_literal: true
require_relative "lib/console_interface"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)
folder_path = "#{current_path}/data"
file_name = "question_*.txt"
number_questions = 5
questions_answers_points = []

puts "Папка не найдена" unless Dir.exist?(folder_path)
puts "Мини-викторина. Ответьте на вопросы!"

Dir.glob("#{folder_path}/#{file_name}").
  sample(number_questions).each do |name|
    questions_answers_points << File.readlines(name, chomp: true)
end

quiz = Quiz.new
console_interface = ConsoleInterface.new(quiz, number_questions)

number_questions.times do | number|
  quiz.current_step(number, questions_answers_points)
  console_interface.print_question(number)
  word = console_interface.get_input
  quiz.play!(word)
  console_interface.print_answer
end

console_interface.print_victory
