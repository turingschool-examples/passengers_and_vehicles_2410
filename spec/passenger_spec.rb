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

    it "a passenger is created with a name and age" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "confirms if the object/instance of a person is an adult or above the age of 18" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end
  end

  describe "#driver?" do
    it "confirms that a Person is not a driver by default" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to eq(false)
    end
  end

  describe "#drive" do
    it "confirms that a person has been assigned as the driver" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to eq(false)
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end