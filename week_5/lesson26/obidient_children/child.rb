# Класс Ребенок
class Child < Parent
  # Ребенок унаследует от родителя все методы (конструктор и метод name), а вот
  # метод obedient у ребенка будет возвращать false
  def obedient
    false
  end
end
