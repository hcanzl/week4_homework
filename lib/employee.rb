class Employee
  attr_accessor :name
  attr_accessor :title
  attr_reader :salary
  
  def initialize name, title, salary
    @name = name
    @title = title
    @salary = salary
  end
end
