class Quiz
  QUESTIONS_COUNT = 5
  OPTIONS_COUNT = 4

  attr_reader :options, :questions, :current_question_number, :total_correct_answers, :total_points
  def initialize(questions)
    @questions = questions.sample(QUESTIONS_COUNT)
    @answers = questions.map(&:answer)
    @current_question_number = 0
    @total_points = 0
    @total_correct_answers = 0
    @options = []
    @start_time = Time.now
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

  def answer_correct?(number)
    @options[number - 1] == correct_answer
  end

  def current_question
    @questions[@current_question_number]
  end

  def current_options!
    @options = @answers.grep_v(correct_answer).sample(OPTIONS_COUNT - 1)
    @options << correct_answer
    @options.shuffle!.map.with_index(1) { |answer, i| "#{i}. #{answer}"}.join("\n")
  end

  def start_time!
    @start_time = Time.now
  end

  def time_limit?
    Time.now - @start_time > 20
  end

  def over?
    QUESTIONS_COUNT == @current_question_number
  end
end
