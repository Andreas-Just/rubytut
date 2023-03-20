# frozen_string_literal: true

class Chameleon
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def color=(color)
    @color = color
  end
end

chameleon = Chameleon.new("красный")

puts "Сейчас я #{chameleon.color}!"
puts "Теперь я #{chameleon.color = "синий"}!"
puts "Теперь я #{chameleon.color = "фиолетовый"}!"

