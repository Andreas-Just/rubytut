# frozen_string_literal: true

# Класс Question представляет собой структуру данных для хранения информации о вопросе,
# включая текст вопроса, ответ, время на ответ, количество баллов и варианты ответов.
class Question
  attr_reader :text, :answer, :answer_time, :points, :options

  def initialize(args)
    @text = args[:text]
    @answer = args[:answer]
    @answer_time = args[:answer_time]
    @points = args[:points]
    @options = args[:options]
  end

  def to_s
    <<~QUESTION
      #{text} (#{points} баллов, #{answer_time} секунд на ответ)

      #{options.map.with_index(1) { |option, i| "#{i}. #{option}" }.join("\n") }
    QUESTION
  end
end
