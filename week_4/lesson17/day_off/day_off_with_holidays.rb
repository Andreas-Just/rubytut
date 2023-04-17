time = Time.now

puts time.wday # what day of the week?

holidays = File.readlines('holidays.txt', chomp: true){ |line| line }
is_holiday = holidays.include?(time.strftime("%d.%m"))

if time.sunday? || time.saturday? || is_holiday
  puts 'Today is a day off!'
else
  puts 'Today is a weekday, back to work!'
end
