# frozen_string_literal: true

def fixture_path(file)
  File.join(__dir__, 'fixtures', file)
end

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
    let(:film_01) { Film.from_file(fixture_path('01.txt')) }
    let(:film_02) { Film.from_file(fixture_path('02.txt')) }

    it 'creates a film from the contents of the file 01.txt' do
      expect(film_01.title).to eq('Список Шиндлера')
      expect(film_01.director).to eq('Стивен Спилберг')
      expect(film_01.year).to eq(1993)
    end

    it 'creates a film from the contents of the file 02.txt' do
      expect(film_02.title).to eq('Начало')
      expect(film_02.director).to eq('Кристофер Нолан')
      expect(film_02.year).to eq(2010)
    end
  end
end
