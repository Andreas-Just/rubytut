# frozen_string_literal: true

# Основной класс игры Game. Хранит состояние игры и предоставляет функции для
# развития игры (ввод новых букв, подсчет кол-ва ошибок и т. п.).
class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status

  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(word)
    abort 'Загадано пустое слово, нечего отгадывать. Закрываемся' if [nil, ''].include?(word)

    # Переводим слово в верхний регистр перед тем, как разбить на буквы.
    # Используем для этого метод upcase в модуле UnicodeUtils.
    word = UnicodeUtils.upcase(word.encode('UTF-8'))

    word.split('')
  end

  def next_step(letter)
    # Введенную пользователем букву Мы также переводим в верхний регистр
    letter = UnicodeUtils.upcase(letter)

    return if @status == -1 || @status == 1

    return if @good_letters.include?(letter) || @bad_letters.include?(letter)

    if @letters.include?(letter)
      @good_letters << letter

      @status = 1 if @good_letters.uniq.sort == @letters.uniq.sort
    else
      @bad_letters << letter
      @errors += 1

      @status = -1 if @errors >= 7
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ''
    letter = $stdin.gets.encode('UTF-8').chomp while letter == ''

    next_step(letter)
  end

end
