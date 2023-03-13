# frozen_string_literal: true
def set_interval(times)
  i = 0

  Thread.new do
    loop do
      if i == times
        break
      end
      sleep 1
      yield
      i += 1
    end
  end
end

user_input = Integer(STDIN.gets, 10, exception: false)

if user_input.nil? || user_input == 0
  user_input = 10
end

show_time = set_interval(user_input) { puts Time.new() }
show_time.kill

