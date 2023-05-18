# frozen_string_literal: true

require 'json'
require_relative 'lib/element'
require_relative 'lib/element_parser'

elements = ElementParser.run("#{__dir__}/data/elements.json")

puts <<~USER_PROMPT
  У нас всего элементов: #{elements.size}
  #{elements.map(&:symbol).join(', ')}

  О каком элементе хотите узнать?

USER_PROMPT

symbol = gets.chomp

element = elements.find { |el| el.symbol == symbol }

if element
  puts element
else
  puts 'Извините, про такой элемент мы еще не знаем.'
end
