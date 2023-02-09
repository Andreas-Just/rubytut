def number?(str)
  while str == '' || str != str.to_i.to_s do
    puts 'Вы должны ввести число'
    str = STDIN.gets.chomp
  end
  str.to_f
end

def imbalance_calculation(quant_dollars, quant_rubles, exchange_rate)
  (((quant_dollars * exchange_rate) - quant_rubles) / 2).round(2)
end
