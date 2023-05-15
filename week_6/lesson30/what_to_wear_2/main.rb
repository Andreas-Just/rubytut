# frozen_string_literal: true

require_relative 'lib/clothing_item'
require_relative 'lib/clothing_collection'

current_path = File.dirname(__FILE__)
files_path = "#{current_path}/data/*.txt"
wardrobe = ClothingCollection.read_from_folder(files_path)

# Запрос температуры у пользователя
puts "Сколько градусов за окном в \u00B0C? (можно с минусом)"
temperature = $stdin.gets.to_i

# Генерация списка подходящей одежды
recommendations = wardrobe.recommend_clothes(temperature)

# Вывод рекомендаций
if recommendations.none?
  puts 'К сожалению, у нас нет одежды для данной температуры.'
else
  puts <<~ADVICE

    Предлагаем сегодня надеть:

    #{recommendations.join("\n")}
  ADVICE
end
