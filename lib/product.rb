# lib/product.rb

class Product
	attr_reader :title, :price, :stock, :brand

	@@products = []		# class attribute // see self.all class method

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@brand = options[:brand]

		begin
			add_to_products		# try to add a new product
		rescue DuplicateProductError		# if the product already exists, record it in the log
			puts "DuplicateProductError: '#{@title}' already exists."
		end
	end

	def edit(options={})
		# updates the attributes of an existing product
		# if the new title already exists, raises an error, even if the duplicate title is itself
		# returns true if no error is raised
		if Product.find_by_title(options[:title])
			raise DuplicateProductError
		end
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@brand = options[:brand]
		true
	end

	def in_stock?
		
		# if product's stock is greater than zero
		# return true
		# else return false

		@stock > 0 ? true : false
	end

	def reduce_stock		# probably should make this method private?
		@stock -= 1
	end

	def self.all
		# returns the class attribute, an array of all products
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
		if Product.find_by_title(self.title)		# if a product of the same name already exists, raise a duplicate product error
			raise DuplicateProductError
		end
		@@products << self
	end

end
