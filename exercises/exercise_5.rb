require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# 1. Output the total revenue for the entire company (all stores), using Active Record's `.sum` calculation method.
# 2. On the next line, also output the average annual revenue for all stores.
# 3. Output the number of stores that are generating $1M or more in annual sales. **Hint:** Chain together `where` and `size` (or `count`) Active Record methods.

# Your code goes here ...

@total_revenue = Store.sum('annual_revenue')
pp "Total company annual revenue is #{@total_revenue}"

@stores_revenue = Store.all
@stores_revenue.all.map { |s| pp "#{s.name} has an annual revenue of #{s.annual_revenue}" }

@stores_over_1M = Store.where("annual_revenue >= 1000000")
pp "There are #{@stores_over_1M.count} stores making over $1,000,000 per year!"