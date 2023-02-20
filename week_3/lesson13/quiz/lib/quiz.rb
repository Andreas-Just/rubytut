class Quiz
  attr_reader :questions, :number_questions

  def initialize(questions, number_questions)
    @questions = questions
    @number_questions = number_questions
    @question = ''
    @answer = ''
    @points = 0
    @total_points = 0
    @total_correct_answers = 0
  end

  def current_step(number)
    @question = @questions[number].question
    @answer = @questions[number].answer
    @points = @questions[number].points.to_i
  end

  def correct_answer
    puts "Неправильно. Правильный ответ: #{@answer}"
  end

  def score_up
    @total_points += @points
    @total_correct_answers += 1
    puts "Верный ответ!"
  end

  def answer_correct?(word)
    word == @answer.downcase
  end

  def current_question
    @question
  end

  def over?(number)
    number == @number_questions
  end

  def summarize
    puts "Правильных ответов: #{@total_correct_answers} из #{@number_questions}"
    puts "Вы набрали #{@total_points} баллов"
  end
end
