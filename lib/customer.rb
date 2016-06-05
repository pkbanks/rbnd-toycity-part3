# lib/customer.rb

class Customer

	attr_reader :name

	@@customers = []


	def initialize(options={})
		@name = options[:name]
		begin
			add_to_customers			# try to add a new customer
		rescue DuplicateCustomerError		# if a customer of the same name already exists, record it in the log
			puts "DuplicateCustomerError: '#{@name}' already exists."
		end
	end

	def purchase(product)
		begin
			Transaction.new(self, product)
		rescue OutOfStockError
			puts "OutOfStockError: '#{product.title}' is out of stock."
		end
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.each do |customer|
			return customer if customer.name == name
		end
		nil
	end

	private

	def add_to_customers
		# puts "hihi #{Customer.find_by_name(self.name).nil?}"
		# puts "hoho #{Customer.find_by_name(self.name)}"
		if Customer.find_by_name(self.name)
			raise DuplicateCustomerError
		end
		@@customers << self
	end
end