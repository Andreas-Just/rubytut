class Quiz
  NUMBER_QUESTIONS = 3

  def initialize(questions)
    @questions = questions
    @current_question_number = 0
    @question = ''
    @answer = ''
    @points = 0
    @total_points = 0
    @total_correct_answers = 0
  end

  def current_step
    @question = @questions[@current_question_number].question
    @answer = @questions[@current_question_number].answer
    @points = @questions[@current_question_number].points.to_i
  end

  def next_question!
    @current_question_number += 1
  end

  def correct_answer
    "Неправильно. Правильный ответ: #{@answer}"
  end

  def score_up!
    @total_points += @points
    @total_correct_answers += 1
    "Верный ответ!"
  end

  def answer_correct?(word)
    word == @answer.downcase
  end

  def current_question
    @question
  end

  def over?
    NUMBER_QUESTIONS == @current_question_number
  end

  def summarize
    "Правильных ответов: #{@total_correct_answers} из #{NUMBER_QUESTIONS}\n" +
    "Вы набрали #{@total_points} баллов"
  end
end
