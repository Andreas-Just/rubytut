# encoding: utf-8
#
# Сундук желаний: программа, которая хранит ваши мечты
#
# (с) goodprogrammer.ru

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Как всегда подключаем парсер и библиотеку для работы с датами
require 'rexml/document'
require 'date'

# Функционал стал сложным и теперь уж точно можно создать класс Желание. Он
# будет заниматься всем, что связано с одним желанием. Подключаем класс Желания.
require_relative 'lib/wish'

file_path = File.join(__dir__, 'data', 'chest.xml')

# Как всегда, считываем данные и строим на их основе XML-структуру с помощью
# гема REXML. На этот раз воспользуемся тем, что метод open возвращает значение,
# которое будет вычислено в блоке и присвоим переменной doc то, что вернет этот
# метод.
doc = File.open(file_path, 'r:UTF-8') do |file|
  REXML::Document.new(file)
end

# Считаем все желания в массив. Каждый элемент массива — объект класса Wish.
# Снова воспользуемся методом map, который собирает массив из того, что вернет
# ему блок для каждого элемента исходного массива.
wishes = doc.get_elements('wishes/wish').map { |wish_node| Wish.new(wish_node) }

# Выводим сперва те желания, которые должны были сбыться, а потом те, до которых
# дело ещё не дошло.
puts
puts 'Эти желания должны были сбыться к сегодняшнему дню'
puts wishes.select(&:overdue?)

puts
puts 'А этим желаниям ещё предстоит сбыться'
puts wishes.reject(&:overdue?)
