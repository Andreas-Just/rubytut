# frozen_string_literal: true
def exception?(number)
  (11..14).include?(number % 100)
end

def declension(number, raccoon, raccoona, raccoons)
  if exception?(number)
    return raccoons
  end

  remainder = number.abs % 10

  if remainder == 1
    return raccoon
  end

  if (2..4).include?(remainder)
    return raccoona
  end

  raccoons
end

noun_cases = %w[енот енота енотов]

puts "Сколько вам енотов?"
user_number = gets.to_i

puts "Вот вам #{user_number} #{declension(user_number, noun_cases[0], noun_cases[1], noun_cases[2])}!"
