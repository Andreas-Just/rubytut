# frozen_string_literal: true
require_relative 'methods'

puts 'Введите ваш вес (в кг.):'
weight = get_number(STDIN.gets.chomp)

puts 'Введите ваш рост (в м.):'
height = get_number(STDIN.gets.chomp)

bmi = body_mass_index(weight, height)

bmi_print(bmi)
