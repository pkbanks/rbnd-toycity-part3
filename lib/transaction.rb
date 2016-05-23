# lib/transaction.rb

class Transaction

	attr_reader :id, :customer, :product

	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		
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


end