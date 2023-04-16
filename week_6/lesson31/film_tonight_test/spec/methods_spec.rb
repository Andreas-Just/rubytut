# frozen_string_literal: true

require_relative '../methods'

RSpec.describe 'Methods' do
  let(:fixture_path) { File.join(__dir__, 'fixtures') }
  let(:movie1) { File.join(fixture_path, '01.txt') }
  let(:movie2) { File.join(fixture_path, '02.txt') }

  describe '#film_from_file' do
    it 'creates a Film object from the first file' do
      film_from_file1 = film_from_file(movie1)

      expect(film_from_file1.title).to eq('Список Шиндлера')
      expect(film_from_file1.director).to eq('Стивен Спилберг')
      expect(film_from_file1.year).to eq(1993)
    end

    it 'creates a Film object from the second file' do
      film_from_file2 = film_from_file(movie2)

      expect(film_from_file2.title).to eq('Начало')
      expect(film_from_file2.director).to eq('Кристофер Нолан')
      expect(film_from_file2.year).to eq(2010)
    end

    it 'creates different Film objects from different files' do
      film_from_file1 = film_from_file(movie1)
      film_from_file2 = film_from_file(movie2)

      expect(film_from_file1.title).not_to eq(film_from_file2.title)
      expect(film_from_file1.director).not_to eq(film_from_file2.director)
      expect(film_from_file1.year).not_to eq(film_from_file2.year)
    end
  end
end
