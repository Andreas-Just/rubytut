# frozen_string_literal: true

# Программа, выбрасывающая значение от 1 до 6 — одну игральную кость, версия 4.
# Подсчет суммы всех бросков.
#
# (с) goodprogrammer.ru

def show_rolling_die
  100.times do
    print "#{rand(1..6)}\r"
    sleep 0.01
  end
end

puts 'How many dice?'
number = gets.to_i
puts

# Объявим переменную, в которую будем добавлять результат выброшенный на каждом
# кубике.
sum = 0

number.times do
  show_rolling_die

  # Кидаем кубик и выводим результат на экран
  die = rand(1..6)
  puts die

  # Добавляем результат к сумме
  sum += die
end

puts
puts "Sum of dice: #{sum}"
