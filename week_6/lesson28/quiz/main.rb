# frozen_string_literal: true
require 'rexml/document'
require_relative "lib/question"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)
file_name = "#{current_path}/data/questions.xml"

unless File.exist?(file_name)
  abort "Извиняемся, хозяин, файл #{file_name} не найден."
end

file = File.new(file_name)
doc = REXML::Document.new(file)
file.close

questions = []
doc.elements.each('questions/question') do |item|
  question = item.text.strip
  answer = item.attributes['answer']
  points = item.attributes['points']
  questions << Question.new(question, answer, points)
end

quiz = Quiz.new(questions)

until quiz.over?
  if quiz.time_limit?
    puts 'Не уложились! Идите учиться!!!'
    exit
  end
  quiz.start_time!

  puts <<~CURRENT_QUIZ_STATUS
    Вопрос #{quiz.current_question_number + 1}:
    «#{quiz.current_question}»
    #{quiz.current_options!}
  CURRENT_QUIZ_STATUS

  until (user_answer = $stdin.gets.to_i).between?(1, quiz.options.size)
    puts 'Выберите номер из предложенных вариантов'
  end

  if quiz.answer_correct?(user_answer)
    puts "Верный ответ!"
    quiz.score_up!
  else
    puts "Неправильно. Правильный ответ: #{quiz.correct_answer}"
  end

  quiz.next_question!
end

if quiz.time_limit?
  puts 'Не уложились! Идите учиться!!!'
else
  puts <<~SUMMARIZE
    Правильных ответов: #{quiz.total_correct_answers} из #{quiz.questions.size}
    Вы набрали #{quiz.total_points} баллов
  SUMMARIZE
end

