class Quiz
  attr_reader :director_options, :title, :year

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
    "Неправильно! Правильный ответ: #{@director}"
  end

  def score_up
    @total_correct_answers += 1
    "Верно!"
  end

  def answer_correct?(number)
    @director_options[number.to_i - 1] == @director
  end

  def over?(number)
    number == @number_questions
  end

  def summarize
    "Вы угадали #{@total_correct_answers} из #{@number_questions} режиссеров"
  end

  private

  def make_director_options(number)
    @director_options = @questions[number].values[0].map(&:director)
  end
end

