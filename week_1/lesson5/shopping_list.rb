# frozen_string_literal: true
groceries = %w[butter milk cereal potatoes chicken tomatoes]

puts "You need to buy: "
groceries.each_with_index { |el, idx| puts (idx + 1).to_s + ". " + el }
puts

# groceries.empty?
# groceries.any?

while groceries.any?
  puts "Still need to buy: " + groceries.to_s
  puts
  puts "What have you bought?"
  product = gets.chomp

  groceries.delete(product.strip)
end

puts "It's done!"
