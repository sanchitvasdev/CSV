class Employee
  attr_reader :name, :empid, :designation
  def initialize(name, empid, designation)
    @name = name
    @empid = empid
    @designation = designation
  end

  def self.generate_hash(table)
	employee_arr = []
	table.each do |row|
	  employee_arr << Employee.new(row['Name'], row['EmpId'], row['Designation'])
	end
	grouped_hash(employee_arr)
  end

  def self.grouped_hash(employee_arr)
    employee_arr.sort_by! { |employee| employee.designation }
    hash_map = employee_arr.group_by { |employee| employee.designation }
    hash_map.each do |_key, employee_arr|
      employee_arr.sort_by! { |employee| employee.empid }
    end
  end
end
