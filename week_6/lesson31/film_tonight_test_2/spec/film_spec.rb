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
    let(:inception) { Film.from_file(fixture_path('inception.txt')) }

    it 'creates a film from the contents of the file' do
      expect(inception.title).to eq('Начало')
      expect(inception.director).to eq('Кристофер Нолан')
      expect(inception.year).to eq(2010)
    end
  end
end
