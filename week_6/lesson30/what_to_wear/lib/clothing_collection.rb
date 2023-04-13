# frozen_string_literal: true
require 'yaml'
class ClothingCollection
  attr_accessor :clothing_items

  def initialize(data_folder_path)
    @clothing_items = read_all_clothing_items(data_folder_path)
  end

  def clothing_type
    clothing_items.map(&:clothing_type).uniq
  end

  def items_of_type(clothing_type)
    clothing_items.select { |item| item.clothing_type == clothing_type }
  end

  private

  def read_clothing_items_from_file(file_path)
    clothing_items = []
    yaml_data = YAML.load_file(file_path)
    name = yaml_data[0]
    clothing_type = yaml_data[1]
    temp_range = yaml_data[2][0]..yaml_data[2][1]
    clothing_items << ClothingItem.new(name, clothing_type, temp_range)
    clothing_items
  end

  def read_all_clothing_items(data_folder_path)
    clothing_items = []
    Dir.glob("#{data_folder_path}/*.y{,a}ml").each do |file_path|
      clothing_items += read_clothing_items_from_file(file_path)
    end
    clothing_items
  end
end
