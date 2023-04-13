# frozen_string_literal: true

require 'yaml'

# Класс ClothingCollection предназначен для хранения и обработки коллекции
# объектов одежды. Он содержит методы для считывания одежды из файлов и
# рекомендации подходящей одежды на основе текущей температуры.
class ClothingCollection
  attr_accessor :clothes

  def initialize(data_folder_path)
    @clothes = read_all_clothes(data_folder_path)
  end

  def clothing_type
    clothes.map(&:clothing_type).uniq
  end

  def items_of_type(clothing_type)
    clothes.select { |item| item.clothing_type == clothing_type }
  end

  private

  def parse_range_from_string(range_string)
    range_bounds = range_string.gsub(/[()]/, '').split(',').map(&:to_i)
    range_bounds[0]..range_bounds[1]
  end

  def read_clothing_items_from_file(file_path)
    clothing_items = []
    File.open(file_path, 'r') do |file|
      until file.eof?
        name = file.readline.strip
        clothing_type = file.readline.strip
        temp_range = parse_range_from_string(file.readline.strip)
        clothing_items << ClothingItem.new(name, clothing_type, temp_range)
      end
    end
    clothing_items
  end

  def read_all_clothes(data_folder_path)
    clothing_collection = []
    Dir.glob("#{data_folder_path}/*.txt").each do |file_path|
      clothing_collection += read_clothing_items_from_file(file_path)
    end
    clothing_collection
  end
end
