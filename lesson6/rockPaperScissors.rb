names = %w[Камень Ножницы Бумага]
computer_choice = rand(3)

puts "введите вариант: 0 - #{names[0].downcase!}, 1 - #{names[1].downcase!}, 2 - #{names[2].downcase!}".capitalize
user_choice = gets.to_i

if user_choice < 0 || user_choice > 2
  puts 'Вы выбрали неверный вариант!'
  exit
end

puts 'Компьютер выбрал: ' + names[computer_choice].capitalize
puts 'Вы выбрали: ' + names[user_choice].capitalize

# в наших числах логика игры такая:
# 0 бьет 1, 1 бьет 2, но 2 бьет 0

if user_choice == computer_choice
  puts 'Ничья'
elsif user_choice == 0 && computer_choice == 1 # у вас камень И у компа ножницы
  puts 'Победили Вы :)'
elsif user_choice == 1 && computer_choice == 2 # у вас ножницы И у компа бумага
  puts 'Победили Вы :)'
elsif user_choice == 2 && computer_choice == 0 # у вас бумага И у компа камень
  puts 'Победили Вы :)'
else
  puts 'Победил Компьютер :('
end
