class AutoShop < Business
  attr_accessor :employees
  
  def initialize name, tax_id, first_employee
    raise ArgumentError, 'first_employee is not an instance of employee' unless first_employee.is_a? Employee
    
    @employees = [first_employee]    
    super(name, tax_id)
  end
   
  def employees
    @employees
  end
   
  def append_employees employee_array
    raise ArgumentError, 'Argument is not an Array' unless employee_array.is_a? Array
    
    @employees.concat(employee_array)
  end
  
  def employee_list
    employee_names = ""
    @employees.each do |employee|
      employee_names.concat(employee.name).concat("\n")
    end
    
    employee_names.chomp
  end
end
