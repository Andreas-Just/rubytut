# frozen_string_literal: true

cars = %w[УАЗ Ford Mercedes BMW Citroen Mazda Toyota Lexus Nissan Volvo]

puts "У нас всего #{cars.length} марок машин. Вам какую?"

begin
  choice = gets.to_i
rescue Interrupt
  puts
  warn 'Произошло прерывание (SIGINT). Завершение программы.'
  exit(1)
end

output_message = if choice < 1 || choice > cars.size
                   'Извините, машины с таким номером у нас нет :('
                 else
                   "Поздравляем, вы получили: #{cars[choice - 1]}"
                 end

begin
  puts output_message
rescue Errno::EIO
  warn 'Произошла ошибка ввода-вывода (EOF). Завершение программы.'
  exit(1)
end
