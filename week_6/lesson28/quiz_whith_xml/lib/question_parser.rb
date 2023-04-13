# frozen_string_literal: true

# Класс QuestionParser отвечает за парсинг XML-файла с вопросами и возвращает массив
# объектов класса Question с атрибутами, считанными из файла.
class QuestionParser
  def self.run(xml_file_path)
    doc = REXML::Document.new(File.read(xml_file_path))
    parse_questions(doc)
  end

  def self.parse_questions(doc)
    doc.get_elements('questions/question').map do |node|
      parse_question(node)
    end
  end

  def self.parse_question(node)
    options, answer = parse_options(node)
    question = node.get_elements('text').first.text
    points = node.attributes['points'].to_i
    answer_time = node.attributes['seconds'].to_i

    Question.new(
      text: question,
      answer: answer,
      answer_time: answer_time,
      points: points,
      options: options.shuffle
    )
  end

  def self.parse_options(node)
    option_nodes = node.get_elements('options/option')
    options = option_nodes.map(&:text)
    answer = option_nodes.find { |option| option['correct'] == 'true' }.text

    [options, answer]
  end
end
