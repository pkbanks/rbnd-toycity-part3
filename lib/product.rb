# lib/product.rb

class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]

		# raise DuplicateProductError if Product.find_by_title(@title)
			
		add_to_products
		
	end

	def in_stock?
		
		# if product's stock is greater than zero
		# return true
		# else return false

		@stock > 0 ? true : false
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		@@products.each do |product|
			return product if product.title == title
		end
	end

	def self.in_stock
		# returns an array of all products with a stock greater than zero
		result = []
		@@products.each do |product|
			result << product if product.in_stock?
		end
		return result
	end

	private

	def add_to_products
		@@products << self
	end
end
