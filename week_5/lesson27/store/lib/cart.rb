# frozen_string_literal: true
class Cart
  def initialize
    @products = []
  end

  def <<(new_product)
    @products << new_product
  end

  def total
    @products.sum(&:price)
  end

  def to_s
    @products
      .tally
      .map { |product, amount| "#{product.info} — #{amount} шт." }
      .join("\n")
  end
end
