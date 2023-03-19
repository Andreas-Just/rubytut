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
  puts <<~PRINT_HAPPY_BIRTHDAY
    Дорогой #{person[:name]},
    Поздравляем Вас с днём рождения!
    Вам сегодня исполняется аж #{person[:age]}!
    #{person[:congratulation]}
  PRINT_HAPPY_BIRTHDAY
end

happy_birthday(person1)
p '--------------------'
happy_birthday(person2)
