$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'employee'
require 'business'
require 'auto_shop'

describe 'AutoShop' do

  it '#superclass is Business' do
    AutoShop.superclass.should eq Business
  end

  describe 'instance' do

    # AutoShop #initialize takes one more parameter than Business.
    # This new parameter is the first employee.
    # Handle the new parameter, then call super (with parameters!) to invoke Business#initialize.
    subject { AutoShop.new 'Mr. Fix It', 'WA987654321', Employee.new('Sue', 'Owner', 0) }

    it '#initialize should raise an ArgumentError for non Employee argument' do
      expect{ AutoShop.new 'Mr. Fix It', 'WA987654321', nil }.to raise_error(ArgumentError)
    end
   
    it '#employees returns an Array' do
      subject.employees.should be_a Array
    end

    it '#append_employees should raise an ArgumentError for non-array arguments' do
      expect{ subject.append_employees(nil) }.to raise_error(ArgumentError)
    end
        
    it '#append_employees accepts an array of employees & increases the number of employees by the size of the array' do
      input = [
                Employee.new('Chu', 'Mechanic',     150_000),
                Employee.new('Lou', 'Receptionist', 90_000)
              ]
      
      lambda {
        subject.append_employees input
      }.should change(subject.employees, :count).by(2)
    end
    
    it '#append_employees accepts an array of employees & append the employees to autoshop employee array' do
      employee1 = Employee.new('Chu', 'Mechanic',     150_000)
      employee2 = Employee.new('Lou', 'Receptionist', 90_000)
      input = [employee1, employee2]
      
      subject.append_employees input
      
      subject.employees.should include(employee1)
    end

    it '#employee_list returns list of employee names' do
      # setup
      input = [Employee.new('Lou', 'Receptionist', 90_000)]
      
      subject.append_employees input
      
      subject.employee_list.should eq "Sue\nLou"
    end
  end
end