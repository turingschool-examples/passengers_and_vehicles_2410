require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
      
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
      expect(taylor).to be_a Passenger
    end
  end

  describe "#adult?" do
    it "returns true if passenger is 18 or older" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.adult?).to eq(true)

      taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
      expect(taylor.adult?).to eq(false)
    end
  end

  describe "#driver?" do
    it "returns false if the passenger is not a driver" do
      passenger = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(passenger.driver?).to eq(false)
    end
    
    it "returns true if the passenger is assigned as the driver" do
      passenger = Passenger.new({"name" => "Charlie", "age" => 18})
      passenger.assign_driver
      expect(passenger.driver?).to eq(true)
    end
  end
end