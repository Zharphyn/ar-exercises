require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# We haven't used the Employee class (and employees table) at all yet. If you look at this table's column structure, 
#   you'll find that it has a `store_id` (integer) column. This is a column that identifies which store each employee belongs to. 
#   It points to the `id` (integer) column of their store.

# Let's tell Active Record that these two tables are in fact related via the `store_id` column.

# 1. Add the following code _directly_ inside the Store model (class): `has_many :employees`
# 2. Add the following code directly inside the Employee model (class): `belongs_to :store`
# 3. Add some data into employees. Here's an example of one (note how it differs from how you create stores): 
#   `@store1.employees.create(first_name:"Khurram", last_name:"Virani", hourly_rate: 60)`
# 4. Go ahead and create some more employees using the create method. You can do this by making multiple calls to create 
#   (like you have before.) No need to assign the employees to variables though. Create them through the `@store#` 
#   instance variables that you defined in previous exercises. Create a bunch under `@store1` (Burnaby) and `@store2` (Richmond). 
#   Eg: `@store1.employees.create(...)`.

# Your code goes here ...

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: { message: "is unacceptable" }
  validates :last_name, presence: { message: "is unacceptable" }
  validates :hourly_rate, numericality: { only_integer: true , greater_than_or_equal_to: 40, less_than_or_equal_to: 200, message: "is unacceptable"}
  validates_associated :store

end

new_employees = [
  {first_name:"Khurram", last_name:"Virani", hourly_rate: 60},
  {first_name:"Brad", last_name:"Thiessen", hourly_rate: 160},
  {first_name:"Dean", last_name:"Marr", hourly_rate: 65},
  {first_name:"Jonathan", last_name:"Borthwick", hourly_rate: 50},
  {first_name:"Krystal", last_name:"Borthwick", hourly_rate: 45},
  {first_name:"Tanya", last_name:"Marie", hourly_rate: 80},
  {first_name:"Jennifer", last_name:"Salembier", hourly_rate: 30},
  {first_name:"Trevor", last_name:"Salembier", hourly_rate: 100},
  {first_name:"Bailey", last_name:"Bell", hourly_rate: 260},
  {first_name:"Christina", last_name:"Thiessen", hourly_rate: 260},
  {first_name:"Sydney", last_name:"Thiessen", hourly_rate: 90},
  {first_name:"Trevor", last_name:"Nisbet", hourly_rate: 65},
  {first_name:"Amanda", last_name:"Brittain", hourly_rate: 35},
  {first_name:"Ian", last_name:"Robson", hourly_rate: 45},
  {first_name:"Brad", last_name:"Potter", hourly_rate: 55}
]

def create_employee store, emp
  @new_emp = store.employees.create(first_name: emp[:first_name], last_name: emp[:last_name], hourly_rate: emp[:hourly_rate])
  @new_emp.valid? 
  pp "Errors for #{emp[:first_name]} #{emp[:last_name]} are: #{@new_emp.errors.full_messages}"

end

store_num = 1
i = 0

while i < new_employees.length do
  case store_num
    when 1
      create_employee @store1, new_employees[i]
    when 2
      create_employee @store2, new_employees[i]
    when 3
      create_employee @store3, new_employees[i]
    when 4
      create_employee @store4, new_employees[i]
    when 5
      create_employee @store5, new_employees[i]
  end
  store_num = store_num < 5 ? store_num + 1 : 1
  i = i + 1
end


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
