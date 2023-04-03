# frozen_string_literal: true
class Question
  attr_reader :question, :answer, :answer_time, :points, :options
  def initialize(question:, answer:, answer_time:, points:, options:)
    @question = question
    @answer = answer
    @answer_time = answer_time
    @points = points
    @options = options
  end

  def to_s
    <<~QUESTION
      #{question} (#{points} баллов, #{answer_time} секунд на ответ)

      #{options.map.with_index(1) { |option, i| "#{i}. #{option}"}.join("\n") }
    QUESTION
  end
end
