# lib/product.rb

class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]

		begin
			add_to_products
		rescue DuplicateProductError
			puts "DuplicateProductError: '#{@title}' already exists."
		end
	end

	def in_stock?
		
		# if product's stock is greater than zero
		# return true
		# else return false

		@stock > 0 ? true : false
	end

	def reduce_stock
		@stock -= 1
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		# title: string, product name/title
		# returns a product with the specified title
		# returns nil if a product of that title is not found
		@@products.each do |product|
			return product if product.title == title
		end
		nil
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
		if Product.find_by_title(self.title)
			raise DuplicateProductError
		end
		@@products << self
	end

end
