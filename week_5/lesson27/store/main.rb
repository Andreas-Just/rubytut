# frozen_string_literal: true
require_relative 'lib/product_collection'
require_relative 'lib/cart'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
cart = Cart.new

collection.sort!(by: :price, order: :asc)

loop do
  collection.remove_out_of_stock!

  puts <<~COLLECTION
    Что хотите купить:
    #{collection}
    0. Выход

  COLLECTION

  user_choice = $stdin.gets.to_i

  break if user_choice <= 0

  chosen_product = collection.by_index(user_choice)

  redo if chosen_product.nil?

  cart << chosen_product
  chosen_product.amount -= 1

  puts <<~SUBTOTAL

    Вы выбрали: #{chosen_product}

    Всего товаров на сумму: #{cart.total} руб.

  SUBTOTAL
end

puts <<~TOTAL

  Вы купили:

  #{cart}

  С Вас — #{cart.total} руб. Спасибо за покупки!
TOTAL
