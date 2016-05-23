# lib/errors.rb

class DuplicateProductError < StandardError
	def initialize
		puts 'a product already exists'
	end
end
