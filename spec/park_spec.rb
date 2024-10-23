# spec/park_spec.rb
require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do
  # Test the initialization of the Park class
  describe "#initialization" do
    it "exists and has attributes" do
      park = Park.new("Yellowstone", 25)

      # Check that the Park object is created successfully
      expect(park).to be_a(Park)
      
      # Ensure the park's name and admission price are correctly assigned
      expect(park.name).to eq("Yellowstone")
      expect(park.admission_price).to eq(25)

      # Ensure the vehicles array is empty upon initialization
      expect(park.vehicles).to eq([])
    end
  end

  # Test adding vehicles to the park
  describe "#add_vehicle" do
    it "can add vehicles to the park and track them" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # Ensure that the vehicle was added correctly
      expect(park.vehicles).to eq([vehicle])
    end
  end

  # Test retrieving all passengers from all vehicles in the park
  describe "#passengers" do
    it "lists all passengers in the park from all vehicles" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create three passengers with different ages
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # Check that the park returns all passengers
      expect(park.passengers).to eq([charlie, jude, taylor])
    end
  end

  # Test listing all attendees
  describe "#all_attendees" do
    it "returns a list of names of all passengers sorted alphabetically" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create three passengers with different ages
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # Ensure that all attendees' names are listed alphabetically
      expect(park.all_attendees).to eq(["Charlie", "Jude", "Taylor"])
    end
  end

  # Test listing minors in the park
  describe "#minors" do
    it "returns a list of minors sorted alphabetically" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create three passengers with different ages
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # Ensure that minors' names are listed alphabetically
      expect(park.minors).to eq(["Taylor"])
    end
  end

  # Test listing adults in the park
  describe "#adults" do
    it "returns a list of adults sorted alphabetically" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create three passengers with different ages
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # Ensure that adults' names are listed alphabetically
      expect(park.adults).to eq(["Charlie", "Jude"])
    end
  end

  # Test calculating the total revenue based on adult passengers
  describe "#revenue" do
    it "calculates revenue based on the number of adult passengers" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create passengers
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      # Add passengers to the vehicle
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # There are 2 adult passengers, so revenue should be 2 * 25 = 50
      expect(park.revenue).to eq(50)
    end

    it "calculates revenue when there are no adults" do
      park = Park.new("Yellowstone", 25)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      # Create passengers, all minors
      kid = Passenger.new({"name" => "Kid", "age" => 10})
      toddler = Passenger.new({"name" => "Toddler", "age" => 3})

      # Add minors to the vehicle
      vehicle.add_passenger(kid)
      vehicle.add_passenger(toddler)

      # Add the vehicle to the park
      park.add_vehicle(vehicle)

      # No adults, so revenue should be 0
      expect(park.revenue).to eq(0)
    end
  end
end