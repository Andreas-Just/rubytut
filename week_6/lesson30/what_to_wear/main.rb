# frozen_string_literal: true
require_relative 'lib/clothing_item'
require_relative 'lib/clothing_collection'

current_path = File.dirname(__FILE__)
clothing_collection = ClothingCollection.new("#{current_path}/data")

# Запрос температуры у пользователя
puts 'Сколько градусов за окном? (можно с минусом)'
temperature = gets.to_i

# Генерация списка подходящей одежды
recommended_clothes = clothing_collection.clothing_type.map do |clothing_type|
  suitable_items = clothing_collection.items_of_type(clothing_type).select do |item|
    item.suitable_for_temperature?(temperature)
  end
  suitable_items.sample
end

# Вывод рекомендаций
puts "\nПредлагаем сегодня надеть:\n\n"
recommended_clothes.each do |item|
  puts "#{item.name} (#{item.clothing_type}) #{item.temp_range}"
end


