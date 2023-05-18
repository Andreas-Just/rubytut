# frozen_string_literal: true

class Element < OpenStruct
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
