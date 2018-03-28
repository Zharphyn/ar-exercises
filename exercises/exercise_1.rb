require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...

# 1. Use Active Record's `create` class method multiple times to create 3 stores in the database:
#   * Burnaby (annual_revenue of 300000, carries men's and women's apparel)
#   * Richmond (annual_revenue of 1260000 carries women's apparel only)
#   * Gastown (annual_revenue of 190000 carries men's apparel only)
# 2. Output (`puts`) the number of the stores using ActiveRecord's `count` method, to ensure that there are three stores in the database.



class Store < ActiveRecord::Base
	has_many :employees
	validates :name, presence: true, length: { minimum: 3 }
	validates :annual_revenue, numericality: { only_integer: true , greater_than_or_equal_to: 0 }
	validates :mens_apparel, inclusion: { in: [true, false] }
	validates :womens_apparel, inclusion: { in: [true, false] }
end

burnaby = Store.create(name: "Burnaby", annual_revenue: 300000, mens_apparel: true, womens_apparel: true )
burnaby.valid? 
pp "Errors for Burnaby are: #{burnaby.errors.full_messages}"
richmond = Store.create(name: "Richmond", annual_revenue: 1260000, mens_apparel: false, womens_apparel: true )
richmond.valid? 
pp "Errors for Richmond are: #{richmond.errors.full_messages}"
gastown = Store.create(name: "Gastown", annual_revenue: 190000, mens_apparel: true, womens_apparel: false )
gastown.valid? 
pp "Errors for Gastown are: #{gastown.errors.full_messages}"

pp "There are #{Store.count} stores in the database"
