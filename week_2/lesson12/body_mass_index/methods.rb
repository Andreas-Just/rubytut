def get_number(str)
  regexp = /(\A[1-9]\d*\z)|(\A\d+\.\d+\z)/

  while str.to_f == 0.0 || !str.match?(regexp)
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
  elsif body_mass_index >= 16 && body_mass_index < 18.5
    return "Недостаточная (дефицит) масса тела"
  elsif body_mass_index >= 18.5 && body_mass_index < 25.0
    return "Норма"
  elsif body_mass_index >= 25.0 && body_mass_index < 30.0
    return "Избыточная масса тела (предожирение)"
  elsif body_mass_index >= 30.0 && body_mass_index < 35.0
    return "Ожирение 1 степени"
  elsif body_mass_index >= 35.0 && body_mass_index < 40.0
    return "Ожирение 2 степени"
  else
    "Ожирение 3 степени"
  end
end

