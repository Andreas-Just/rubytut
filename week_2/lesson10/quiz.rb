# frozen_string_literal: true
current_path = File.dirname(__FILE__)

folder_path = "#{current_path}/data"
file_name = /question_\d/
number_questions = 3
correct_answers = 0

question_files = Dir.entries(folder_path)

if Dir.exist?(folder_path)
  puts "Мини-викторина. Ответьте на вопросы."

  random_file = question_files.select {|name| name =~ file_name}.shuffle.first(number_questions)
  questions_answers = []
  random_file.each do |name|
    file = File.new("#{folder_path}/#{name}", "r:UTF-8")
    questions_answers << file.readlines
    file.close
  end

  questions_answers.each do | arr |
    question, answer = arr
    answer_options = [answer.delete("\n"), answer.delete("\n").downcase]

    puts question

    user_answer = nil

    while user_answer.nil? || user_answer == '' do
      user_answer = gets.chomp.strip
    end

    if answer_options.include?(user_answer)
      correct_answers += 1
      puts "Верный ответ!"
    else
      puts "Неправильно. Правильный ответ: #{answer}"
    end
  end

  puts "Правильных ответов: #{correct_answers} из #{number_questions}"

else
  puts "Папка не найдена"
end
