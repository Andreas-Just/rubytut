# frozen_string_literal: true
def billion?(number)
  return number >= 1 * 10 ** 9
end

def exception?(number)
  remainder100 = number % 100
  return remainder100 >= 11 && remainder100 <= 14
end

def declension(number)
  if number == nil || !number.is_a?(Numeric)
    number = 0
  end

  if exception?(number)
    return "енотов"
  end

  remainder = number % 10
  p remainder

  if remainder == 1
    return "енот"
  end

  if remainder >= 2 && remainder <= 4
    return "енота"
  end

  if (remainder >= 5 && remainder <= 9) || remainder == 0
    return "енотов"
  end
end

p "Сколько вам енотов?"
user_number = gets.to_i

if billion?(user_number)
  p "Закатай губу! Еноты так попадут в красную книгу."
  exit
end

p "Вот вам #{user_number} #{declension(user_number)}!"
