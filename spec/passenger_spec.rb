require './lib/passenger'
require 'Rspec'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
      
      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)

      taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
      expect(taylor).to be_a Passenger

      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "tests if passenger is an adult" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.adult?).to eq(true)

      taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
      expect(taylor.adult?).to eq(false)      
    end
  end

  describe "#driver?" do
    it "tests if person is the driver" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
      
      expect(charlie.driver?).to eq(false)

      charlie.drive

      expect(charlie.driver?).to eq(true)
    end
  end
  

end