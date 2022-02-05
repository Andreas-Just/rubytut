cars = %w[УАЗ Ford Mercedes BMW Citroen Mazda Toyota Lexus Nissan Volvo]

puts "У нас всего #{cars.length} марок машин. Вам какую?"
choice = gets.to_i

if choice < 1 || choice > cars.size
  puts 'Извините, машины с таким номером у нас нет :('
else
  puts "Поздравляем, вы получили: #{cars[choice - 1]}"
end
