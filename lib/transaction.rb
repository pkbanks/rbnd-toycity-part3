# lib/transaction.rb

class Transaction

	attr_reader :id, :customer, :product

	@@id = 1
	@@transactions = []

	def initialize(customer, product)

		# raise an error if the product is out of stock
		raise OutOfStockError unless product.in_stock?
		
		@id = @@id
		@@id += 1

		@customer = customer
		@product = product

		@product.reduce_stock

		@@transactions << self

	end

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions.each do |transaction|
			return transaction if transaction.id == id
		end
	end

	def self.find_by_customer(customer)
		# customer: an instance of the customer class
		# returns an array of transactions
		# assumes that the customer exists // whether a customer exists should be handled where it's called
		# if the customer exists and there are no transactions, return an empty array
		result = []
		@@transactions.each do |transaction|
			if transaction.customer == customer
				result << transaction
			end
		end
		result
	end


end