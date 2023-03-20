require_relative 'lib/credit_request'

# age - возраст
# gender - пол (m/w)
# salary - доход
# credit_history - кредитная история (y/n)
# request_amount - запрашиваемая сумма

puts "Добро пожаловать! Кредитная организация рада вашему запросу!"
puts

puts "Сколько вам полных лет?"
age = gets.to_i

puts "Какая у вас месячная зарплата (в рублях)?"
salary = gets.to_i

puts "Какой ваш пол (m/w):"
gender = gets[0]

puts "Есть ли у вас кредитная история (y/n)?"
credit_history = gets[0]

puts "Сколько денег вы хотите взять?"
request_amount = gets.to_i

credit_request =
  CreditRequest.new(age, salary, gender, credit_history, request_amount)

if credit_request.approve?
  puts "Ваш кредит одобрен!"
else
  puts "Извините, попробуйте обратиться позже"
end
