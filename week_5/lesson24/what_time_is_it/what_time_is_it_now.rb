# frozen_string_literal: true
def set_interval(times)
  i = 0

  loop do
    if i == times
      break
    end
    yield
    sleep 1
    i += 1
  end
end

puts "Сколько раз вывести время?"

user_input = Integer(STDIN.gets, 10, exception: false)

if user_input.nil? || user_input == 0
  user_input = 10
end

set_interval(user_input.abs) { puts Time.new() }

