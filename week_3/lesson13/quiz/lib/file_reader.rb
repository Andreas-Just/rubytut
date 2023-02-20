# frozen_string_literal: true
class FileReader
  attr_reader :questions

  def initialize(path, file_name, question)
    @path = path
    @file_name = file_name
    @question = question
    @questions = []
  end

  def run
    self.get_files.map do |file_name|
          question, answer, points  = File.readlines(file_name, chomp: true)
          @question.new(question, answer, points)
        end
  end

  private

  def get_files
    puts "Папка не найдена" unless Dir.exist?(@path)

    Dir.glob("#{@path}/#{@file_name}")
  end
end
