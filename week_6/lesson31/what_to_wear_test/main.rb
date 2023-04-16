# frozen_string_literal: true

require_relative 'lib/clothing_item'
require_relative 'lib/clothing_collection'

current_path = File.dirname(__FILE__)
files_path = "#{current_path}/data/*.txt"
wardrobe = ClothingCollection.read_from_folder(files_path)

# Запрос температуры у пользователя
temperature = nil
user_input = nil

puts 'Сколько градусов за окном в \u00B0C? (можно с минусом)'

begin
  while user_input.nil? || !user_input.is_a?(Integer)
    user_input_str = $stdin.gets

    # Выход из цикла, если ввод закрыт или достигнут конец файла
    break if user_input_str.nil?

    user_input_str.strip!

    break if user_input_str.downcase == 'exit' # Выход из цикла при вводе "exit"

    user_input = Integer(user_input_str, 10, exception: false)

    if user_input.is_a?(Integer)
      temperature = user_input
    else
      puts 'Пожалуйста, введите корректное значение температуры (целое число) или "exit" для выхода.'
    end
  end
rescue Interrupt
  puts 'Ввод температуры был прерван. Завершение программы.'
  exit(0)
end

# Если пользователь ввел "exit", завершаем программу
exit(0) if temperature.nil?

# Генерация списка подходящей одежды
recommendations = wardrobe.recommend_clothes(temperature)

# Вывод рекомендаций
if recommendations.all?(&:nil?)
  puts 'К сожалению, у нас нет одежды для данной температуры.'
else
  puts <<~ADVICE

    Предлагаем сегодня надеть:

    #{recommendations.join("\n")}
  ADVICE
end
