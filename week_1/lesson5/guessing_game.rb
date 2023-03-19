min_number = 0
max_number = 15
guessed_number_range = min_number..max_number
guessed_number = rand(guessed_number_range)
answers = {
  hot: "Горячо ",
  warmth: "Тепло ",
  cold: "Холодно ",
  need_more: "(нужно больше)",
  need_less: "(нужно меньше)",
  congratulation: "Поздравляю Вы угадали!"
}

puts "Загадано число от #{min_number} до #{max_number}, отгадайте какое?"

3.times do
  user_number = Integer(STDIN.gets, 10, exception: false)

  unless guessed_number_range.include?(user_number)
    puts "Выберите номер из заданного диапазона"
    redo
  end

  deviation_range = user_number - guessed_number
  deviation_side = deviation_range.positive?
  direction_designator = deviation_side ? answers[:need_less] : answers[:need_more]

  if user_number == guessed_number
    puts answers[:congratulation]
    exit
  end

  proximity =
    case deviation_range.abs
    when 1 then answers[:hot]
    when 2..5 then answers[:warmth]
    else answers[:cold]
    end

  puts "#{proximity} #{direction_designator}"
end

puts "В этот раз вам не повезло. Было загадано число #{guessed_number.to_s}"
