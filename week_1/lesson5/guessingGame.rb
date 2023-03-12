end_of_range = 15
number = rand(end_of_range + 1)
answers = {
  hot: 'Горячо ',
  warmth: 'Тепло ',
  cold: 'Холодно ',
  need_more: '(нужно больше)',
  need_less: '(нужно меньше)',
  congratulation: 'Поздравляю Вы угадали!'
}

puts 'Загадано число от 0 до 15, отгадайте какое?'

3.times do
  attempt = Integer(STDIN.gets, 10, exception: false)

  if attempt.nil? || !attempt.to_i.between?(0, end_of_range)
    puts 'Выберите номер из заданного диапазона'
    redo
  end

  if attempt == number
    puts answers[:congratulation]
    exit
  else
    deviation_range = (attempt - number)
    deviation_side = deviation_range.positive?

    if deviation_range.abs == 1
      puts answers[:hot] + (deviation_side ? answers[:need_less] : answers[:need_more])
    elsif (2..5).include?(deviation_range.abs)
      puts answers[:warmth] + (deviation_side ? answers[:need_less] : answers[:need_more])
    else
      puts answers[:cold] + (deviation_side ? answers[:need_less] : answers[:need_more])
    end
  end
end

puts 'В этот раз вам не повезло. Было загадано число ' + number.to_s
