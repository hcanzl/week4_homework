$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'business'

describe Business do
  
  subject { Business.new 'Patricia Jones', 'WA12345' }
  
  it '#business_card attributes are initialized' do
    subject.address = '2152 Jackson St., Lynden, WA'
    subject.hours = '10:00am to 6:00pm'
    subject.business_card.should eq "Patricia Jones\n==============\n\n2152 Jackson St., Lynden, WA\nOpen: 10:00am to 6:00pm\nTax Id: WA12345"
  end

end

