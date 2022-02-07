names = []
user_input = nil
name = nil

puts 'Введите имена через Enter: '
while user_input != '' do
  user_input = gets.chomp

  names << user_input
end

for n in names do
  if n == 'Элис' || n == 'Alice'
    name = n
    puts "#{n}??? Кто такая #{n}?"
    sleep 1
    break
  elsif n != ''
    puts 'C нами ' + n
    sleep 1
  end
end

if names.include?('Элис') || names.include?('Alice')
  puts 'Что это за девочка и где она живет?'
  sleep 1
  puts 'А вдруг она не курит? А вдруг она не пьёт?'
  sleep 1
  puts "А мы с такими рожами возьмем да и припрёмся к #{name}..."
end
