$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'employee'

describe Employee do

  subject { Employee.new 'Patricia', 'Chief Scientist', 300_000 }

  it 'attributes are initialized' do
    "#{subject.name}, #{subject.title}".should eq "Patricia, Chief Scientist"
  end

  it 'Employee does not have a setter method for salary instance variable' do
    subject.should_not respond_to :salary=
  end
end

