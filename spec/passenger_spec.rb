require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  # Test for the initialization of a Passenger object
  describe "#initialization" do 
    it "exists and has attributes" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  # Creating a Passenger instance
      expect(charlie).to be_a Passenger                            # Check if the object is of the Passenger class

      taylor = Passenger.new({"name" => "Taylor", "age" => 12})    # Creating another instance for testing
      
      # Test for name and age attributes
      expect(charlie.name).to eq("Charlie")  # Checks that charlie's name is correctly assigned
      expect(charlie.age).to eq(18)          # Checks that charlie's age is correctly assigned
      expect(taylor.name).to eq("Taylor")    # Checks that taylor's name is correctly assigned
      expect(taylor.age).to eq(12)           # Checks that taylor's age is correctly assigned
    end
  end

  # Test for adult? method
  describe "#adult?" do
    it "determines if the passenger is an adult based on age" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Check if charlie is an adult (age >= 18)
      expect(charlie.adult?).to eq(true)

      # Check if taylor is not an adult (age < 18)
      expect(taylor.adult?).to eq(false)
    end
  end

  # Test for driver? method and drive method
  describe "#driver?" do
    it "determines if the passenger is a driver and can change driving status" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})

      # Initially, charlie should not be a driver
      expect(charlie.driver?).to eq(false)

      # After calling drive, charlie should become a driver
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end
