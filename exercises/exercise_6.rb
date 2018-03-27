require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# We haven't used the Employee class (and employees table) at all yet. If you look at this table's column structure, 
# 	you'll find that it has a `store_id` (integer) column. This is a column that identifies which store each employee belongs to. 
# 	It points to the `id` (integer) column of their store.

# Let's tell Active Record that these two tables are in fact related via the `store_id` column.

# 1. Add the following code _directly_ inside the Store model (class): `has_many :employees`
# 2. Add the following code directly inside the Employee model (class): `belongs_to :store`
# 3. Add some data into employees. Here's an example of one (note how it differs from how you create stores): 
# 	`@store1.employees.create(first_name:"Khurram", last_name:"Virani", hourly_rate: 60)`
# 4. Go ahead and create some more employees using the create method. You can do this by making multiple calls to create 
# 	(like you have before.) No need to assign the employees to variables though. Create them through the `@store#` 
# 	instance variables that you defined in previous exercises. Create a bunch under `@store1` (Burnaby) and `@store2` (Richmond). 
# 	Eg: `@store1.employees.create(...)`.

# Your code goes here ...

class Employee < ActiveRecord::Base
	belongs_to :store
end

@store1.employees.create(first_name:"Khurram", last_name:"Virani", hourly_rate: 60)
@store1.employees.create(first_name:"Brad", last_name:"Thiessen", hourly_rate: 160)
@store1.employees.create(first_name:"Dean", last_name:"Marr", hourly_rate: 65)
@store2.employees.create(first_name:"Jonathan", last_name:"Borthwick", hourly_rate: 50)
@store2.employees.create(first_name:"Krystal", last_name:"Borthwick", hourly_rate: 45)
@store2.employees.create(first_name:"Tanya", last_name:"Marie", hourly_rate: 80)
@store3.employees.create(first_name:"Jennifer", last_name:"Salembier", hourly_rate: 30)
@store3.employees.create(first_name:"Trevor", last_name:"Salembier", hourly_rate: 100)
@store4.employees.create(first_name:"Christina", last_name:"Thiessen", hourly_rate: 260)
@store3.employees.create(first_name:"Bailey", last_name:"Bell", hourly_rate: 260)
@store4.employees.create(first_name:"Sydney", last_name:"Thiessen", hourly_rate: 90)
@store4.employees.create(first_name:"Trevor", last_name:"Nisbet", hourly_rate: 65)
@store5.employees.create(first_name:"Amanda", last_name:"Brittain", hourly_rate: 35)
@store5.employees.create(first_name:"Ian", last_name:"Robson", hourly_rate: 45)
@store5.employees.create(first_name:"Brad", last_name:"Potter", hourly_rate: 55)

pp "------------------- STORE 1 -------------------"
@store1.employees.all.map { |s| pp "#{s.first_name} #{s.last_name} has an hourly rate of #{s.hourly_rate}" }
pp "------------------- STORE 2 -------------------"
@store2.employees.all.map { |s| pp "#{s.first_name} #{s.last_name} has an hourly rate of #{s.hourly_rate}" }
pp "------------------- STORE 3 -------------------"
@store3.employees.all.map { |s| pp "#{s.first_name} #{s.last_name} has an hourly rate of #{s.hourly_rate}" }
pp "------------------- STORE 4 -------------------"
@store4.employees.all.map { |s| pp "#{s.first_name} #{s.last_name} has an hourly rate of #{s.hourly_rate}" }
pp "------------------- STORE 5 -------------------"
@store5.employees.all.map { |s| pp "#{s.first_name} #{s.last_name} has an hourly rate of #{s.hourly_rate}" }
