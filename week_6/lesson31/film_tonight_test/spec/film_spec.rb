# frozen_string_literal: true

RSpec.describe Film do
  describe '#initialize' do
    let(:film) { Film.new('The Godfather', 'Francis Ford Coppola', 1972) }

    it 'assigns title, director, and year' do
      expect(film.title).to eq('The Godfather')
      expect(film.director).to eq('Francis Ford Coppola')
      expect(film.year).to eq(1972)
    end
  end

  describe '#to_s' do
    let(:film) { Film.new('The Godfather', 'Francis Ford Coppola', 1972) }

    it 'returns a formatted string with film information' do
      expect(film.to_s).to eq('Francis Ford Coppola — The Godfather (1972)')
    end
  end

  describe '.from_file' do
    let(:schindler_list) { Film.from_file(fixture_path('01.txt')) }
    let(:inception) { Film.from_file(fixture_path('02.txt')) }

    it 'creates a film from the contents of the file 01.txt' do
      expect(schindler_list.title).to eq('Список Шиндлера')
      expect(schindler_list.director).to eq('Стивен Спилберг')
      expect(schindler_list.year).to eq(1993)
    end

    it 'creates a film from the contents of the file 02.txt' do
      expect(inception.title).to eq('Начало')
      expect(inception.director).to eq('Кристофер Нолан')
      expect(inception.year).to eq(2010)
    end
  end
end
