# frozen_string_literal: true
require_relative 'book'
require_relative 'film'
require_relative 'disk'

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'disks', class: Disk}
  ]

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc

    self
  end

  def remove_out_of_stock!
    @products.reject! { |product| product.amount == 0 }
  end

  def by_index(product_index)
    @products[product_index - 1]
  end

  def to_s
    @products.map.with_index(1) { |item, i| "#{i}. #{item}" }.join("\n")
  end
end
