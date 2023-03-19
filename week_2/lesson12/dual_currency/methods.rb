def get_number(str)
  regexp = /\A\d+(\.\d{1,12})?\z/
  until str.match?(regexp)
    puts 'Вы должны ввести целое число или дробное число'
    str = STDIN.gets.chomp
  end
  str.to_f
end

def imbalance_calculation(quant_dollars, quant_rubles, exchange_rate)
  (((quant_dollars * exchange_rate) - quant_rubles) / 2).round(2)
end
