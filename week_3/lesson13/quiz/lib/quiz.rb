class Quiz
  attr_reader :question, :answer, :point, :total_points, :correct_answers, :is_correct_answer

  def initialize
    @question = nil
    @answer = nil
    @point = nil
    @total_points = 0
    @correct_answers = 0
    @is_correct_answer = true
  end

  def current_step(number, questions_answers_points)
    @question, @answer, @point = questions_answers_points[number]
  end

  def play!(answer)
    if @answer.downcase == answer
      @total_points += @point.to_i
      @correct_answers += 1
      @is_correct_answer = true
    else
      @is_correct_answer = false
    end
  end
end
