require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
    end

    it "has readable attributes" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
    end

    it "can create other passengers" do
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(taylor).to be_a Passenger
    end
  end

  describe "#adult?" do
    it "can determine if passenger is an adult" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.adult?).to be true
      expect(taylor.adult?).to be false
    end
  end

  describe "#driver?/#drive" do
    it "has passenger driver status false by default" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      
      expect(charlie.driver?).to be false
      expect(taylor.driver?).to be false
    end

    it "can change a passenger's driver status" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.driver?).to be false

      charlie.drive
      expect(charlie.driver?).to be true
    end
  end
end