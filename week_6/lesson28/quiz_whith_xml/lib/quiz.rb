# frozen_string_literal: true

# Класс Quiz представляет собой игру-викторину, содержащую набор вопросов,
# выбранных из предоставленных. Он отслеживает текущий номер вопроса,
# общее количество правильных ответов и общее количество набранных очков.
# Он также предоставляет методы для проверки правильности ответа, увеличения
# счета и перехода к следующему вопросу.
class Quiz
  QUESTIONS_COUNT = 5
  OPTIONS_COUNT = 4

  attr_reader :questions, :current_question_number, :total_correct_answers, :total_points

  def initialize(questions)
    @questions = questions.sample(QUESTIONS_COUNT)
    @answers = questions.map(&:answer)
    @current_question_number = 0
    @total_points = 0
    @total_correct_answers = 0
  end

  def current_question
    @questions[@current_question_number]
  end

  def options
    current_question.options
  end

  def correct_answer
    current_question.answer
  end

  def answer_correct?(number)
    options[number - 1] == correct_answer
  end

  def score_up!
    @total_points += current_question.points
    @total_correct_answers += 1
  end

  def next_question!
    @current_question_number += 1
  end

  def over?
    QUESTIONS_COUNT == @current_question_number
  end
end
