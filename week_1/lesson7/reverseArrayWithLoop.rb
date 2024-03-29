# Записываем массив в переменную numbers и выводим его на экран
array = [1, 2, 3, 4, 5, 6, 7]
puts 'Исходный массив:'
puts array.to_s

# Создадим новый массив (пока пустой), куда будем класть элементы исходного в
# обратном порядке
reverse_array = []

# Проходим в цикле по исходному массиву numbers
for item in array do
  # И добавляем каждый элемент в начало нового массива методом unshift (добавить
  # в начало)
  reverse_array.unshift(item)
end

# Осталось вывести полученный массив на экран
puts 'Новый массив, полученный из исходного:'
puts reverse_array.to_s
