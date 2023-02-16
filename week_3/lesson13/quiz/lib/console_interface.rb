class ConsoleInterface
  def initialize(quiz, number_questions)
    @quiz = quiz
    @number_questions = number_questions
  end

  def print_victory
    puts "Правильных ответов: #{@quiz.correct_answers} из #{@number_questions}"
    puts "Вы набрали #{@quiz.total_points} баллов"
  end

  def print_question(number)
    puts <<~CURRENT_QUIZ_STATUS
      Вопрос #{number + 1}: 
      #{@quiz.question}
    CURRENT_QUIZ_STATUS
  end

  def print_answer
    if @quiz.is_correct_answers
      puts "Верный ответ!"
    else
      puts "Неправильно. Правильный ответ: #{@quiz.answer}"
    end
  end

  def get_input
    gets.chomp.strip.downcase
  end
end
