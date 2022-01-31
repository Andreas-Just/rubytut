number = rand(21)
answers = {
  :hot => 'Горячо ',
  :warmth => 'Тепло ',
  :cold => 'Холодно ',
  :need_more => '(нужно больше)',
  :need_less => '(нужно меньше)',
  :congratulation => 'Поздравляю Вы угадали!'
}

puts 'Загадано число от 0 до 20, отгадайте какое?'

attempt = gets.to_i
if attempt == number
  puts answers[:congratulation]
  exit
else
  deviation_range = (attempt - number)
  deviation_side = deviation_range.positive?

  if deviation_range == 1
    puts answers[:hot] + (deviation_side ? answers[:need_less] : answers[:need_more])
  elsif (2..5).include?(deviation_range.abs)
    puts answers[:warmth] + (deviation_side ? answers[:need_less] : answers[:need_more])
  else
    puts answers[:cold] + (deviation_side ? answers[:need_less] : answers[:need_more])
  end
end

attempt = gets.to_i
if attempt == number
  puts answers[:congratulation]
  exit
else
  deviation_range = (attempt - number)
  deviation_side = deviation_range.positive?

  if deviation_range == 1
    puts answers[:hot] + (deviation_side ? answers[:need_less] : answers[:need_more])
  elsif (2..5).include?(deviation_range.abs)
    puts answers[:warmth] + (deviation_side ? answers[:need_less] : answers[:need_more])
  else
    puts answers[:cold] + (deviation_side ? answers[:need_less] : answers[:need_more])
  end
end

attempt = gets.to_i
if attempt == number
  puts answers[:congratulation]
  exit
else
  deviation_range = (attempt - number)
  deviation_side = deviation_range.positive?

  if deviation_range == 1
    puts answers[:hot] + (deviation_side ? answers[:need_less] : answers[:need_more])
  elsif (2..5).include?(deviation_range.abs)
    puts answers[:warmth] + (deviation_side ? answers[:need_less] : answers[:need_more])
  else
    puts answers[:cold] + (deviation_side ? answers[:need_less] : answers[:need_more])
  end
end

puts 'В этот раз вам не повезло. Было загадано число ' + number.to_s
