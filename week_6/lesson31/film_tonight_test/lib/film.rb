# frozen_string_literal: true

# Класс Film представляет собой фильм, включая его название, режиссера и
# год выпуска. Он может использоваться для хранения информации об отдельных
# фильмах и выполнения различных операций, связанных с фильмами, таких как
# извлечение информации из файла.
class Film
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def to_s
    "#{director} — #{title} (#{year})"
  end
end
