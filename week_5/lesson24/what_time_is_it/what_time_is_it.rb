# frozen_string_literal: true
puts "Сколько раз вывести время?"

user_input = Integer(STDIN.gets, 10, exception: false)

if user_input.nil? || user_input == 0
  user_input = 10
end

user_input.abs.times do
  puts Time.now
  sleep 1
end

