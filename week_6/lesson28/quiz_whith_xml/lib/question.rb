# frozen_string_literal: true

class Question
  attr_reader :text, :answer, :answer_time, :points, :options

  def initialize(text:, answer:, answer_time:, points:, options:)
    @text = text
    @answer = answer
    @answer_time = answer_time
    @points = points
    @options = options
  end

  def to_s
    <<~QUESTION
      #{text} (#{points} баллов, #{answer_time} секунд на ответ)

      #{options.map.with_index(1) { |option, i| "#{i}. #{option}" }.join("\n") }
    QUESTION
  end
end
