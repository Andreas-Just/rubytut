# frozen_string_literal: true
class Question
  NUMBER_OPTIONS = 4

  attr_reader :questions, :answer
  def initialize(films, number_questions)
    @films = films
    @number_questions = number_questions
    @questions = []
  end

  def run
    @number_questions.times do
      films_options = films_by_number_options
      @questions << Hash(films_options.sample => films_options)
    end
    @questions
  end

  private
  def films_by_number_options
    @films.uniq(&:director).sample(NUMBER_OPTIONS)
  end
end
