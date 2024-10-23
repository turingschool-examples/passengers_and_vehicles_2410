require './lib/passenger'
require './lib/vehicle'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do
  describe "#initialize" do
    it "exists" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
            
      expect(vehicle).to be_a (Vehicle)
    end

    it "has attributes" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  describe "#speeding?" do
    it "can have a speeding vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.speed).to be(true)
    end

    it "determines if the vehicle is speeding" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.speeding?).to be (false)
      vehicle.speed
      expect(vehicle.speeding?).to be (true)
    end
  end

  describe "#passengers" do
    it "starts a vehicle with an empty array of passengers" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.passengers).to eq([])
    end

    it "can add passengers to the passengers array" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end

  describe "#num_adults" do
    it "determines the number of adult passengers in a vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.num_adults).to eq(2)
    end
  end

  describe "#enter_park" do
    it "cant enter a park" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.enter_park).to be(true)
    end
  end
end
            