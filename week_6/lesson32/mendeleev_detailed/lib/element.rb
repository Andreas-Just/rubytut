# frozen_string_literal: true

class Element
  attr_reader :symbol, :name, :discoverer, :year, :density, :number

  def initialize(symbol, details)
    @symbol = symbol
    @name = details['name']
    @discoverer = details['discoverer']
    @year = details['year']
    @density = details['density']
    @number = details['number']
  end

  def to_s
    year_str = year.is_a?(Integer) ? "#{year} г." : year

    <<~ELEMENT_INFO
      Порядковый номер: #{number}
      Название: #{name}
      Первооткрыватель: #{discoverer} (#{year_str})
      Плотность: #{density} г/см³
    ELEMENT_INFO
  end
end
