# frozen_string_literal: true
def get_user_radius(str)
  return Integer(str, 10, exception: false)
end

def number?(num)
  while num.nil? do
    puts 'Вы должны ввести номер'
    num = get_user_radius(gets)
  end
  return num
end

def area_of_circle(radius)
  return radius *= Math::PI
end

puts "Введите радиус круга:"
user_radius = number?(get_user_radius(gets))

puts "Площадь круга: #{area_of_circle(user_radius)}"

puts "Введите радиус второго круга:"
user_radius = number?(get_user_radius(gets))

puts "Площадь второго круга: #{area_of_circle(user_radius)}"
