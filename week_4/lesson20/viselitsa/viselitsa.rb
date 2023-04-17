# frozen_string_literal: true

# Популярная детская игра
# https://ru.wikipedia.org/wiki/Виселица_(игра)

# Подключаем библиотеку unicode_utils. Предварительно её надо установить, набрав
# в консоли
#
# gem install unicode_utils
require 'unicode_utils'

require_relative 'game'
require_relative 'result_printer'
require_relative 'word_reader'

puts "Игра виселица. Версия 4. (c) goodprogrammer.ru\n\n"
sleep 1

printer = ResultPrinter.new

word_reader = WordReader.new

words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"

# Все изменения логики будут у нас в классе Game. Нам нужно в двух местах
# преобразовать полученные данные в верхний регистр, используя метод upcase
# подключенного модуля UnicodeUtils: при генерации массива букв из полученного
# слова в конструкторе и при получении новой буквы от пользователя.
game = Game.new(word_reader.read_from_file(words_file_name))

while game.status.zero?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
