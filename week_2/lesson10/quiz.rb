# frozen_string_literal: true
current_path = File.dirname(__FILE__)

folder_path = "#{current_path}/data"
file_name = /question_\d/

question_files = Dir.entries(folder_path)

if Dir.exist?(folder_path)
  puts "Папка найдена"

  random_file = question_files.select {|name| name =~ file_name}.shuffle.first(3)
  lines = []
  question = random_file.each do |name|
    file = File.new("#{folder_path}/#{name}", "r:UTF-8")
    lines << file.readlines
    file.close
  end

  puts question
  puts lines.to_s

else
  puts "Папка не найдена"
end
