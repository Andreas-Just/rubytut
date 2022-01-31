puts 'Вы хотите конвертировать:'
puts '1. Доллары в гривны'
puts '2. Гривны в доллары'
choice = gets.to_i

unless (1..2).include?(choice)
  abort 'Вы выбрали неверный вариант конвертации!'
end

puts 'Какой текущий курс 1 доллара к гривне?:'
usd_rate = gets.to_f

if usd_rate == 0
  abort 'Неправильный обменный курс!'
end

if choice == 1
  puts 'Количество долларов?:'
  amount_usd = gets.to_f
  conversion_result = amount_usd * usd_rate
else choice == 2
  puts 'Количество гривен?:'
  amount_uah = gets.to_f
  conversion_result = amount_uah / usd_rate
end


puts 'Результат конвертации: ' + (choice == 1 ? '₴ ' : '$ ') + conversion_result.round(2).to_s
