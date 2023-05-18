# frozen_string_literal: true

require 'pathname'

RSpec.describe 'Data files' do
  data_path = File.join(__dir__, '..', 'data')
  data_files = Dir[File.join(data_path, '*.txt')]

  shared_examples 'a valid data file' do |file_path|
    it "has a .txt extension for #{file_path}" do
      expect(File.extname(file_path)).to eq('.txt')
    end

    it "has valid content for #{file_path}" do
      lines = File.readlines(file_path, chomp: true)

      expect(lines.size).to eq(3)

      # Check title
      expect(lines[0]).to match(/^[A-Za-zА-Яа-яЁё\s\d.,!?:;«»-]+$/)

      # Check director name
      expect(lines[1]).to match(/^(?:[A-ZА-ЯЁ][a-zа-яё]+(?:\s?|-?))+$/)

      # Check year
      expect(lines[2]).to match(/^\d+$/)
    end
  end

  data_files.each do |file|
    describe "data file: #{file}" do
      include_examples 'a valid data file', file
    end
  end
end
