# frozen_string_literal: true
groceries = %w[butter, milk, cereal, potatoes, chicken, tomatoes]

# groceries.empty?
# groceries.any?

while groceries.any?
  puts groceries.to_s
  puts "What have you bought?"
  product = gets.chomp

  groceries.delete(product)
end

puts "It's done!"
