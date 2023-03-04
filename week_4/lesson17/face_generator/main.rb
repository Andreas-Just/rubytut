# frozen_string_literal: true
current_path = File.dirname(__FILE__)
time = Time.now

faces =
  Dir[File.join(current_path, 'data', '*.txt')]
    .each_with_object({}) do |file, option|
      file_name = file.match(/\/(\w+)\.txt/)[1]
      option[file_name] = File.readlines(file, chomp: true)
    end

file_name_face = "face_#{time.strftime("%Y.%m.%d_%H-%M-%S")}"
file_face = File.new("#{current_path}/data/#{file_name_face}.txt" , "a:UTF-8")

file_face.puts(faces["foreheads"].sample)
file_face.puts(faces["eyes"].sample)
file_face.puts(faces["noses"].sample)
file_face.puts(faces["mouths"].sample)

file_face.close
