# frozen_string_literal: true

# Класс ClothingItem представляет отдельный предмет одежды. Он содержит информацию
# о названии, типе одежды и диапазоне температур, при которых этот предмет одежды
# рекомендуется носить. Класс также предоставляет метод для определения, подходит ли
# предмет одежды для заданной температуры.
class ClothingItem
  attr_reader :name, :type, :temp_range

  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @temp_range = args[:temp_range]
  end

  def suitable_for_temperature?(temperature)
    temp_range.include?(temperature)
  end

  def to_s
    "#{name} (#{type}) #{temp_range.min}\u00B0C..#{temp_range.max}\u00B0C"
  end
end
