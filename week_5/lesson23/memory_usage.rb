# frozen_string_literal: true
puts "В числе «42» - #{42.size} байт"
puts "В строке «Василий» - #{" Василий ".bytesize} байт"

a = nil
@baby = nil

if defined?(a)
  puts "Переменная 'a' определена"
else
  puts "Переменная 'a' не определена"
end

if defined?(b)
  puts "Переменная 'b' определена"
else
  puts "Переменная 'b' не определена"
end

puts local_variables.include?(:a)
puts instance_variable_defined?("@baby")
puts "-------------------------------"
puts [].respond_to?(:size)
puts [].respond_to?(:orange)
puts "-------------------------------"
puts Object.const_defined?(:String)
puts Object.const_defined?(:A)
puts "-------------------------------"

class User
  attr_reader :name, :country

  def initialize(name)
    @name = name
    @country = "Spain"
  end

  def country?
    defined?(@country)
  end
end

user = User.new("Artur")

puts user&.name
puts user&.country
puts user&.country?
puts defined?(user&.age)
