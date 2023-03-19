# frozen_string_literal: true
def multiple(number)
  if (number % 15).zero?
    "Тыры-Пыры"
  elsif (number % 5).zero?
    "Пыры"
  elsif (number % 3).zero?
    "Тыры"
  else
    number
  end
end

[*1..100].each { |el| puts multiple(el) }

