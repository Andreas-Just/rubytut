def get_number(str)
  until Float(str, exception: false).to_f.positive?
    puts 'Вы должны ввести целое число или дробное число, не ноль'
    str = STDIN.gets.chomp
  end
  str.to_f
end

def imbalance_calculation(quant_dollars, quant_rubles, exchange_rate)
  (((quant_dollars * exchange_rate) - quant_rubles) / 2).round(2)
end
