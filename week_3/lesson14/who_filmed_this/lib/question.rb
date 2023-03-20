# frozen_string_literal: true
class Question
  NUMBER_OPTIONS = 4
  def initialize(films, number_questions)
    @films = films
    @number_questions = number_questions
    @questions = []
  end

  def run
    @number_questions.times do
      film_options = films_by_number_options

      current_film = film_options.sample

      while self.uniq_film?(current_film)
        current_film = film_options.sample
      end

      @questions << Hash(current_film => film_options)
    end
    @questions
  end

  private
  def films_by_number_options
    @films.uniq(&:director).sample(NUMBER_OPTIONS)
  end

  def uniq_film?(current_film)
    @questions.any? do |el|
      el.keys[0].title == current_film.title
    end
  end
end
