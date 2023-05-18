# frozen_string_literal: true

class ElementParser
  def self.run(json_file_path)
    file = File.read(json_file_path, encoding: 'UTF-8')
    elements_data = JSON.parse(file)
    elements_data.map { |symbol, details| Element.new(symbol, details) }
  end
end
