# frozen_string_literal: true
require 'rexml/document'
require 'timeout'
require_relative "lib/question_parser"
require_relative "lib/question"
require_relative "lib/quiz"

current_path = File.dirname(__FILE__)
file_name = "#{current_path}/data/questions.xml"

unless File.exist?(file_name)
  abort "Извиняемся, хозяин, файл #{file_name} не найден."
end

questions = QuestionParser.run(file_name)
quiz = Quiz.new(questions)

until quiz.over?
  puts <<~CURRENT_QUIZ_STATUS

    Вопрос #{quiz.current_question_number + 1}:
    #{quiz.current_question}
  CURRENT_QUIZ_STATUS

  user_answer = ''
  begin
    Timeout.timeout(quiz.current_question.answer_time) do
      until (user_answer = $stdin.gets.to_i).between?(1, quiz.options.size)
        puts 'Выберите номер из предложенных вариантов'
      end
    end
  rescue Timeout::Error
    puts 'Не уложились! Идите учиться!!!'
    break
  end

  if quiz.answer_correct?(user_answer)
    puts "Верный ответ!"
    quiz.score_up!
  else
    puts "Неправильно. Правильный ответ: #{quiz.correct_answer}"
  end

  quiz.next_question!
end

puts <<~SUMMARIZE

  Правильных ответов: #{quiz.total_correct_answers} из #{quiz.questions.size}
  Вы набрали #{quiz.total_points} баллов
SUMMARIZE

