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

[*1..100].each do |number|
  puts multiple(number)
end
