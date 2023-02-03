time = Time.now

puts time.wday # what day of the week?
puts time.year # what year?
puts time.dst? # is it daylight savings?
puts (time + (60*60*24*365)).wday # what's the day of the week a year later?
puts

if time.sunday? || time.saturday?
  puts 'Today is a day off!'
else
  puts 'Today is a weekday, back to work!'
end
