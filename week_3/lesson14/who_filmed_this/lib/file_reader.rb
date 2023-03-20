# frozen_string_literal: true
class FileReader

  def initialize(current_path, folder_path, file_name, file_class)
    @current_path = current_path
    @folder_path = folder_path
    @file_name = file_name
    @file_class = file_class
  end

  def run
    self.get_files.map do |file_name|
          title, director, year  = File.readlines(file_name, chomp: true)
          @file_class.new(title, director, year)
        end
  end

  private

  def get_files
    puts "Папка не найдена" unless Dir.exist?("#{@current_path}/#{@folder_path}")

    Dir[File.join(@current_path,@folder_path, @file_name)]
  end
end
