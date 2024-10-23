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

    it "has attributes" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "determines if a Passenger is an adult" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      charlie.adult?
      taylor.adult?
      expect(charlie.adult?).to be(true)
      expect(taylor.adult?).to be (false)
    end
  end

  describe "#driver?" do
    it "can have a a passenger drive" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.drive).to be(true)
    end

    it "determines if a Passenger is a driver or not" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.driver?).to be (false)
      charlie.drive
      expect(charlie.driver?).to be (true)
    end
  end
end