# frozen_string_literal: true

require_relative '../lib/film'

RSpec.describe Film do
  let(:film) { Film.new('Список Шиндлера', 'Стивен Спилберг', 1993) }

  it 'has a title' do
    expect(film.title).to eq('Список Шиндлера')
  end

  it 'has a director' do
    expect(film.director).to eq('Стивен Спилберг')
  end

  it 'has a year' do
    expect(film.year).to eq(1993)
  end

  it 'has a string representation' do
    expect(film.to_s).to eq('Стивен Спилберг — Список Шиндлера (1993)')
  end
end
