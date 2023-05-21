# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'rexml/document'
require 'date'

begin
  uri = URI.parse('https://www.cbr.ru/scripts/XML_daily.asp')
  response = Net::HTTP.get_response(uri)
  doc = REXML::Document.new(response.body)
  value = doc.root.elements['//Valute[@ID="R01235"]/Value'].text.tr(',', '.').to_f

  exchange_rate = value.to_f
rescue StandardError => e
  puts "Произошла ошибка при получении данных: #{e.message}"
  puts 'Пожалуйста, введите его вручную:'

  exchange_rate = gets.to_f
end

puts "Курс доллара #{exchange_rate}"

puts 'Введите кол-во долларов у вас на руках:'
quant_dollars = $stdin.gets.to_f

puts 'Введите кол-во рублей у вас на руках'
quant_rubles = $stdin.gets.to_f

disbalance = (((quant_dollars * exchange_rate) - quant_rubles) / 2).round(2)

if disbalance.abs < exchange_rate
  puts 'Ваш портфель сбалансирован'
elsif disbalance.positive?
  puts "Вам нужно купить #{disbalance} рублей"
else
  puts "Вам нужно продать #{disbalance.abs} рублей"
end
