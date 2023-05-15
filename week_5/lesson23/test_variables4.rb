string1 = 'Я первая строка'

class MyClass
  def initialize
    @string2 = 'Я вторая строка'
  end

  def print_string1
    puts string1
  end
end

my_class = MyClass.new
puts @string2
my_class.print_string1
