class Quiz
  NUMBER_OPTIONS = 4

  attr_reader :correct_answers, :is_correct_answer, :movies

  def initialize(films, number_questions)
    @films = films
    @correct_answers = 0
    @is_correct_answer = true
    @number_questions = number_questions
    @movies = []
  end

  def run
    @number_questions.times do
      fo = films_options
      @movies << Hash(film(fo).director => fo)
    end
  end

  def directors_options(films_options)
    films_options.map(&:director)
  end

  def play!(director, number)
    if @film.director.downcase == director
      @correct_answers += 1
      @is_correct_answer = true
    else
      @is_correct_answer = false
    end
  end

  private
  def films_options
    @films.uniq(&:hash).sample(NUMBER_OPTIONS)
  end

  def film(films_options)
    films_options.sample
  end

  # def directors_options
  #   films_options = @films.uniq(&:hash).sample(NUMBER_OPTIONS)
  #   @directors_options = films_options.map(&:director)
  #   @film = films_options.sample
  # end

end

