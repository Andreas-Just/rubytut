# frozen_string_literal: true
def exception?(number)
  remainder100 = number % 100
  remainder100 >= 11 and remainder100 <= 14
end

def declension(number, raccoon, raccoona, raccoons)
  if number.nil?
    number = 0
  end

  if exception?(number)
    return raccoons
  end

  remainder = number % 10

  if remainder == 1
    return raccoon
  end

  if remainder >= 2 and remainder <= 4
    return raccoona
  end

  return raccoons
end

#-------------------------------------
noun_cases = %w[енот енота енотов]

puts "Сколько вам енотов?"
user_number = gets.to_i

puts "Вот вам #{user_number} #{declension(user_number, noun_cases[0], noun_cases[1], noun_cases[2])}!"
