# frozen_string_literal: true
current_path = File.dirname(__FILE__)

folder_path = "#{current_path}/data"
file_name = "question_*.txt"
number_questions = 3
correct_answers = 0
questions_answers = []

puts "Папка не найдена" unless Dir.exist?(folder_path)

puts "Мини-викторина. Ответьте на вопросы."

question_files = Dir.glob("#{folder_path}/#{file_name}")

question_files.sample(number_questions).each do |name|
  questions_answers << File.readlines(name, chomp: true)
end

questions_answers.each do | question, answer, hv |
  puts question

  user_answer = nil

  while user_answer.nil? || user_answer == '' do
    user_answer = gets.chomp.strip
  end

  if answer.downcase == user_answer.downcase
    correct_answers += 1
    puts "Верный ответ!"
  else
    puts "Неправильно. Правильный ответ: #{answer}"
  end
end

puts "Правильных ответов: #{correct_answers} из #{number_questions}"
