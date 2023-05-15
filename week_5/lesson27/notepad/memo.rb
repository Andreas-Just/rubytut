# encoding: utf-8
#
# Класс «Заметка», разновидность базового класса «Запись»
class Memo < Post
  # Отдельный конструктор здесь не нужен, т. к. у заметки нет дополнительных
  # переменных экземпляра.

  # Напишем реализацию метода read_from_console для экземпляра заметки. Он
  # спрашивает у пользователя текст заметки все строки (до слова end) и
  # записывает их в переменную экземпляра, массив @text.
  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'

    # Для старта цикла запишем в переменную line nil
    line = nil

    # Пока в переменной line не окажется (пока пользователь не введет) слово
    # «end», крутимся в цикле и считываем строку за строкой в массив @text.
    until line == 'end'
      # Читаем очередную строку и записываем из ввода пользователя
      line = STDIN.gets.chomp

      # Напомню, что изначально в переменной @text у нас пустой массив (смотрите
      # конструктор класса-родителя Post).
      @text << line
    end

    # Удалим последний элемент из массива @text — там служебное слово «end»,
    # которое мы не хотим видеть в нашей заметке.
    @text.pop
  end

  # Метод to_string должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей заметки: помимо всех строк массива @text (тела
  # заметки) мы положим туда строку с датой создания заметки.
  def to_strings
    # Сгенерируем строку с датой создания заметки используя объект класса Time,
    # который у нас находится в переменной @created_at (смотрите конструктор
    # класса-родителя Post).
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"

    # Возвращаем массив @text с добавление в начало (методом массива unshift)
    # строчки с датой создания заметки.
    @text.unshift(time_string)
  end
end
