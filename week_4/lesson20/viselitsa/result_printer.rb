# frozen_string_literal: true

# Класс ResultPrinter, печатающий состояние и результаты игры.
class ResultPrinter
  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"

      # Проверку наличия файла можно заменить на блок begin-rescue, при этом
      # ловить только конкретную ошибку обращения к файловой системе.
      #
      # https://ruby-doc.org/core/SystemCallError.html
      begin
        file = File.new(file_name, 'r:UTF-8')
        @status_image << file.read
        file.close
      rescue SystemCallError
        # Если случилась такая ошибка мы продолжаем работать дальше, т.к. без
        # изображения виселицы вполне можно играть.
        @status_image << "\n [ изображение не найдено ] \n"
      end

      counter += 1
    end
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end

  def print_status(game)
    cls

    puts
    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(', ')}"

    print_viselitsa(game.errors)

    case game.status
    when -1
      puts
      puts 'Вы проиграли :('
      puts "Загаданное слово было: #{game.letters.join('')}"
      puts
    when 1
      puts
      puts 'Поздравляем, вы выиграли!'
      puts
    else
      puts "У вас осталось ошибок: #{7 - game.errors}"
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ''

    letters.each { |item|
      result += good_letters.include?(item) ? "#{item} " : '__ '
    }
    result
  end

  def cls
    system('clear') || system('cls')
  end
end
