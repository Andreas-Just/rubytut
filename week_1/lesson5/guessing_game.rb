end_of_range = 15
number = rand(end_of_range + 1)
answers = {
  hot: "Горячо ",
  warmth: "Тепло ",
  cold: "Холодно ",
  need_more: "(нужно больше)",
  need_less: "(нужно меньше)",
  congratulation: "Поздравляю Вы угадали!"
}

puts "Загадано число от 0 до #{end_of_range}, отгадайте какое?"

3.times do
  attempt = Integer(STDIN.gets, 10, exception: false)

  if attempt.nil? || !attempt.to_i.between?(0, end_of_range)
    puts "Выберите номер из заданного диапазона"
    redo
  end

  deviation_range = attempt - number
  deviation_side = deviation_range.positive?
  direction_designator = deviation_side ? answers[:need_less] : answers[:need_more]

  if attempt == number
    puts answers[:congratulation]
    exit
  end

  if deviation_range.abs == 1
    puts answers[:hot] + direction_designator
  elsif (2..5).include?(deviation_range.abs)
    puts answers[:warmth] + direction_designator
  else
    puts answers[:cold] + direction_designator
  end

end

puts "В этот раз вам не повезло. Было загадано число #{number.to_s}"
