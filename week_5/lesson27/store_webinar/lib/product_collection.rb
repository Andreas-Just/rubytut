# encoding: utf-8
#
# Класс КоллекцияПродуктов, который может считывать все нужные продукты из
# подкатегорий films, books и т.д.
require_relative 'book'
require_relative 'film'
require_relative 'disk'

class ProductCollection
  # Создадим константу со всеми возможными типами продуктов. Это массив,
  # элементы которого — ассоциативные массивы с название папки (где лежат
  # файлы этого типа) и ссылкой на класс.
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'disks', class: Disk}
  ]

  # Конструктор коллекции принимает на вход массив продуктов, но если ничего не
  # передали на вход, то он записывает в переменную экземпляра @products пустой
  # массив.
  def initialize(products = [])
    @products = products
  end

  # Метод класса (статический метод) from_dir считывает из указанной в
  # параметрах папки все файлы:
  #
  # фильмы — из dir_path + '/films';
  # книги — из dir_path + '/books'.
  def self.from_dir(dir_path)
    # Создаем пустой массив, куда будем складывать все найденные продукты
    products = []

    # Пройдемся по каждой паре ключ-значение из константы PRODUCT_TYPES и
    # поочередно запишем эту пару соответственно в переменные type и hash.
    #
    # Сначала в hash будет {dir: 'films', class: Film},
    # потом {dir: 'books', class: Book}
    #
    PRODUCT_TYPES.each do |hash|
      # Получим из хэша путь к директории с файлами нужного типа, например,
      # строку 'films'
      product_dir = hash[:dir]

      # Получим из хэша объект нужного класса, например класс Film. Обратите
      # внимание, мы оперируем сейчас классом, как объектом. Передаем его по
      # ссылки и вызываем у него методы. Такова природа руби: все — объекты.
      product_class = hash[:class]

      # Для каждого текстового файла из директории, например '/data/films/'
      # берем путь к файлу и передаем его в метод класса from_file, вызывая его
      # у объекта нужного класса.
      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    # Вызываем конструктор этого же класса (ProductCollection) и передаем ему
    # заполненный массив продуктов
    self.new(products)
  end

  # Метод sort! меняет экземпляр класса ProductCollection (меняет порядок)
  # продуктов в коллекции, поэтому он назвал с восклицательным знаком. Этот
  # метод принимает на вход ассоциативный массив, в котором могут быть два
  # ключа: :by и :order. Например, чтобы отсортировать продукты по возрастанию
  # цены, можно вызвать этот метод так:
  #
  # collection.sort!(by: :price, order: :asc)
  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
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
