# spec/vehicle_spec.rb
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  # Test initialization and attributes
  describe "#initialization" do
    it "exists and has attributes" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Check that vehicle is an instance of Vehicle
      expect(vehicle).to be_a(Vehicle)
      
      # Check if the vehicle attributes are correctly assigned
      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")

      # The vehicle should not be speeding by default
      expect(vehicle.speeding?).to eq(false)

      # The passengers array should be empty upon initialization
      expect(vehicle.passengers).to eq([])
    end
  end

  # Test for speeding behavior
  describe "#speeding?" do
    it "can check and change speeding status" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      
      # Initially, the vehicle should not be speeding
      expect(vehicle.speeding?).to eq(false)

      # After calling speed, the vehicle should be speeding
      vehicle.speed
      expect(vehicle.speeding?).to eq(true)
    end
  end

  # Test for adding passengers and counting adults
  describe "#add_passenger" do
    it "can add passengers and track them" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Creating passenger instances
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Verify that passengers are added
      expect(vehicle.passengers).to eq([charlie, jude, taylor])

      # Ensure the number of passengers is correctly counted
      expect(vehicle.passengers.count).to eq(3)
    end
  end

  # Test for counting the number of adults in the vehicle
  describe "#num_adults" do
    it "counts the number of adult passengers in the vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Creating passenger instances with different ages
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Check the number of adults
      expect(vehicle.num_adults).to eq(2)
    end

    it "returns 0 when there are no adults in the vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Creating only minors as passengers
      kid = Passenger.new({"name" => "Kid", "age" => 12})
      toddler = Passenger.new({"name" => "Toddler", "age" => 3})

      # Add minors to the vehicle
      vehicle.add_passenger(kid)
      vehicle.add_passenger(toddler)

      # Expect no adults
      expect(vehicle.num_adults).to eq(0)
    end
  end
end
