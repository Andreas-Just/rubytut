
class Book
  attr_reader :author, :title, :year

  def initialize( author, title, year)
    @author = author
    @title = title
    @year = year
  end
end

book_1 = Book.new("Альберт Эйнштейн", "Мир, каким я его вижу", 1934)
book_2 = Book.new("Джон Рональд Руэл Толкин", "Властелин колец", [1954, 1955])
book_3 = Book.new("Джордж Реймонд Ричард Мартин", "Песнь льда и пламени", [1996, 1998, 2000, 2005, 2011, 2023])

puts "Книга 1: #{book_1.author} «#{book_1.title}», #{book_1.year}"
puts "Книга 1: #{book_2.author} «#{book_2.title}», #{book_2.year}"
puts "Книга 1: #{book_3.author} «#{book_3.title}», #{book_3.year}"
