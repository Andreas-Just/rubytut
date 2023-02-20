class Quiz
  attr_reader :director_options

  def initialize(questions, number_questions)
    @questions = questions
    @number_questions = number_questions
    @director_options = []
    @title = ''
    @director = ''
    @year = 0
    @total_correct_answers = 0
  end

  def current_step(number)
    self.make_director_options(number)

    current_film = @questions[number].keys[0]
    @title = current_film.title
    @director = current_film.director
    @year = current_film.year
  end

  def correct_answer
    puts "Неправильно! Правильный ответ: #{@director}"
  end

  def score_up
    @total_correct_answers += 1
    puts "Верно!"
  end

  def answer_correct?(number)
    @director_options[number.to_i - 1] == @director
  end

  def current_question(number)
    puts <<~CURRENT_QUIZ_STATUS
      Вопрос #{number + 1}:
      Кто снял «#{@title}» (#{@year})
    CURRENT_QUIZ_STATUS
    self.print_options
  end

  def over?(number)
    number == @number_questions
  end

  def summarize
    puts "Вы угадали #{@total_correct_answers} из #{@number_questions} режиссеров"
  end

  private

  def make_director_options(number)
    @director_options = @questions[number].values[0].map(&:director)
  end

  def print_options
    @director_options.each.with_index(1) do | director, idx |
      puts "#{idx}. #{director}"
    end
  end

end

