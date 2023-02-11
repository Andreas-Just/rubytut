# frozen_string_literal: true
require 'net/http'
require 'uri'
require 'rexml/document'
require 'date'
require_relative 'methods'

uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')
response = Net::HTTP.get_response(uri)
doc = REXML::Document.new(response.body)
value = nil

# R01235 — Доллар США
doc.each_element('//Valute[@ID="R01235"]') do |currency_tag|
  value = currency_tag.get_text('Value').to_s.tr(',', '.').to_f
end

exchange_rate = value.to_f
puts "Курс доллара #{exchange_rate}"

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
