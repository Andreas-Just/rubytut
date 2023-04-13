# frozen_string_literal: true

class QuestionParser
  def self.run(xml_file_path)
    doc = REXML::Document.new(File.read(xml_file_path))

    doc.get_elements('questions/question').map do |node|
      option_nodes = node.get_elements('options/option')
      options = option_nodes.map(&:text)
      answer = option_nodes.find { |option| option['correct'] == 'true' }.text
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
  end
end
