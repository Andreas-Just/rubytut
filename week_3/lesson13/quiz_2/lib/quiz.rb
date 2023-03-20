class Quiz
  NUMBER_QUESTIONS = 5

  attr_reader :questions, :total_correct_answers, :total_points
  def initialize(questions)
    @questions = questions.sample(NUMBER_QUESTIONS)
    @current_question_number = 0
    @total_points = 0
    @total_correct_answers = 0
  end

  def next_question!
    @current_question_number += 1
  end

  def correct_answer
    current_question.answer
  end

  def score_up!
    @total_points += current_question.points
    @total_correct_answers += 1
  end

  def answer_correct?(word)
    word.strip.downcase == correct_answer.downcase
  end

  def current_question
    @questions[@current_question_number]
  end

  def over?
    NUMBER_QUESTIONS == @current_question_number
  end
end
