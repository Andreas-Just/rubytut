# frozen_string_literal: true
class Question
  attr_reader :question, :answer, :points
  def initialize(question, answer, points)
    @question = question
    @answer = answer
    @points = points.to_i
  end
end
