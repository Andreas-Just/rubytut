# frozen_string_literal: true

require_relative 'lib/film'

def film_from_file(file_path)
  lines = File.readlines(file_path, chomp: true)
  Film.new(lines[0], lines[1], lines[2].to_i)
end
