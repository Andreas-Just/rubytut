# frozen_string_literal: true
require_relative 'methods'

puts "Введите курс доллара:"
exchange_rate = get_number(STDIN.gets.chomp)

puts 'Введите кол-во долларов у вас на руках:'
quant_dollars = get_number(STDIN.gets.chomp)

puts 'Введите кол-во рублей у вас на руках'
quant_rubles = get_number(STDIN.gets.chomp)

disbalance = imbalance_calculation(quant_dollars, quant_rubles, exchange_rate)

if disbalance.abs < exchange_rate
  puts 'Ваш портфель сбалансирован'
elsif disbalance > 0
  puts "Вам нужно купить #{disbalance} рублей"
else
  puts "Вам нужно продать #{disbalance.abs} рублей"
end
