# frozen_string_literal: true
class ClothingItem
  attr_accessor :name, :clothing_type, :temp_range

  def initialize(name, clothing_type, temp_range)
    @name = name
    @clothing_type = clothing_type
    @temp_range = temp_range
  end

  def suitable_for_temperature?(temperature)
    temp_range.include?(temperature)
  end
end
