# frozen_string_literal: true
person1 = {
  :name => 'Борис',
  :age => 48,
  :congratulation => 'Желаем успехов в лечении простатита!',
}
person2 = {
  :name => 'Антон',
  :age => 62,
  :congratulation => 'Желаем успехов в лечении геморроя!',
}

def happy_birthday(person)
  <<~TEXT_HAPPY_BIRTHDAY

    Дорогой #{person[:name]},

    Поздравляем Вас с днём рождения!
    Вам сегодня исполняется аж #{person[:age]}!

    #{person[:congratulation]}

  TEXT_HAPPY_BIRTHDAY
end

puts happy_birthday(person1)
puts '                *  *  *'
puts happy_birthday(person2)
