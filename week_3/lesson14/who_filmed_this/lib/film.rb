class Film
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year.to_i
  end

  def hash
    @director
  end

  def find(str)
    @director == str
  end
end

# f1 = Film.new("1", "1", "1")
# f2 = Film.new("1", "2", "1")
# f3 = Film.new("2", "1", "2")
# f4 = Film.new("1", "3", "1")

# puts f1 == f2
# puts [f1, f2, f3].uniq
# puts [f1, f2, f3, f4].uniq{|f| f.hash }.map(&:director)
# puts [f1, f2, f3, f4].uniq(&:hash).map(&:director)
