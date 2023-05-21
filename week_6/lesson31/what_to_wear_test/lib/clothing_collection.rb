# frozen_string_literal: true

# Класс ClothingCollection предназначен для хранения и обработки коллекции
# объектов одежды. Он содержит методы для считывания одежды из файлов и
# рекомендации подходящей одежды на основе текущей температуры.
class ClothingCollection
  attr_reader :clothes

  def initialize(clothing_collection)
    @clothes = clothing_collection
  end

  def clothing_types
    clothes.map(&:type).uniq
  end

  def items_of_type(clothing_type)
    clothes.select { |item| item.type == clothing_type }
  end

  def suitable_items_for_type(clothing_type, temperature)
    items_of_type(clothing_type).select do |item|
      item.suitable_for_temperature?(temperature)
    end
  end

  def recommend_clothes(temperature)
    clothing_types.map do |clothing_type|
      suitable_items_for_type(clothing_type, temperature).sample
    end
  end

  def size
    @clothes.size
  end

  def each(&block)
    @clothes.each(&block)
  end

  class << self
    def read_from_folder(files_path)
      clothing_collection = Dir[files_path].map do |path|
        clothing_data = File.readlines(path).map(&:strip)
        ClothingItem.new(
          name: clothing_data[0],
          type: clothing_data[1],
          temp_range: parse_range_from_string(clothing_data[2])
        )
      end
      new(clothing_collection)
    end

    private

    def parse_range_from_string(range_string)
      range_array = range_string.gsub(/[()]/, '').split(',').map(&:to_i)
      range_array[0]..range_array[1]
    end
  end
end
