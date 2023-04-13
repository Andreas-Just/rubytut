# frozen_string_literal: true

# Класс ClothingItem представляет отдельный предмет одежды. Он содержит информацию
# о названии, типе одежды и диапазоне температур, при которых этот предмет одежды
# рекомендуется носить. Класс также предоставляет метод для определения, подходит ли
# предмет одежды для заданной температуры.
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
