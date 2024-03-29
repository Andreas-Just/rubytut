# frozen_string_literal: true

# Программа, которая выбирает произвольную карту игральной колоды, версия 2.
# Масти — юникод-символы.
#
# (с) goodprogrammer.ru

values = %w[2 3 4 5 6 7 8 9 10 J Q K A]

# Создадим массив с набором мастей, вместо названия масти — иконка-символ
suits = %w[♦ ♠ ♥ ♣]

puts "#{values.sample}#{suits.sample}"
