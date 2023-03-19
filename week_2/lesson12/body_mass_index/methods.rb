def get_number(str)
  until Float(str, exception: false).to_f.positive?
    puts 'Вы должны ввести целое число или дробное число, не ноль'
    str = STDIN.gets.chomp
  end

  str.to_f
end

def body_mass_index(weight, height)
  (weight / height**2).round(2)
end


def bmi_print(body_mass_index)
  if body_mass_index < 16
    "Выраженный дефицит массы тела"
  elsif body_mass_index < 18.5
    "Недостаточная (дефицит) масса тела"
  elsif body_mass_index < 25.0
    "Норма"
  elsif body_mass_index < 30.0
    "Избыточная масса тела (предожирение)"
  elsif body_mass_index < 35.0
    "Ожирение 1 степени"
  elsif body_mass_index < 40.0
    "Ожирение 2 степени"
  else
    "Ожирение 3 степени"
  end
end

