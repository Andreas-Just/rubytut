number = rand(16)
answers = {
  :hot => 'Горячо ',
  :warmth => 'Тепло ',
  :cold => 'Холодно ',
  :need_more => '(нужно больше)',
  :need_less => '(нужно меньше)',
  :congratulation => 'Поздравляю Вы угадали!'
}

  puts 'Загадано число от 0 до 15, отгадайте какое?'

3.times do

  # attempt = nil
  #
  # while attempt == '' || attempt != attempt.to_i.to_s do
  #   attempt = gets.chomp
  # end
  #
  # attempt = attempt.to_i

  attempt = Integer(gets, exception: false)

  if attempt.nil?
    puts 'Вы должны выбрать номер'
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

  attempt = gets.to_i
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

  attempt = gets.to_i
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

  puts 'В этот раз вам не повезло. Было загадано число ' + number.to_s
end

