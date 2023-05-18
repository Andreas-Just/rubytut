# frozen_string_literal: true

# Класс Film представляет собой фильм, включая его название, режиссера и
# год выпуска. Он может использоваться для хранения информации об отдельных
# фильмах и выполнения различных операций, связанных с фильмами, таких как
# извлечение информации из файла.
class Film
  attr_reader :title, :director, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true)
    title = lines[0]
    director = lines[1]
    year = lines[2].to_i

    new(title, director, year)
  end

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def to_s
    "#{director} — #{title} (#{year})"
  end
end
