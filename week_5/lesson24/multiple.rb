# frozen_string_literal: true
def multiple(num)
  if (num % 15).zero?
    "Тыры-Пыры"
  elsif (num % 5).zero?
    "Пыры"
  elsif (num % 3).zero?
    "Тыры"
  else
    num
  end
end

numbers = (1..100).to_a

numbers.each do |number|
  puts multiple(number)
end
