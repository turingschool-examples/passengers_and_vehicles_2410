require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
  describe "#initialize" do
    it "exists" do
      park1 = Park.new("Underwood", 10)
      park2 = Park.new("Washburn", 5)
      park3 = Park.new("Wheeler", 15)
            
      expect(park1).to be_a (Park)
      expect(park2).to be_a (Park)
      expect(park3).to be_a (Park)
    end

    it "has attributes" do
      park1 = Park.new("Underwood", 10)
      park2 = Park.new("Washburn", 5)
      park3 = Park.new("Wheeler", 15)

      expect(park1.name).to eq("Underwood")
      expect(park1.price).to eq(10)
      expect(park2.name).to eq("Washburn")
      expect(park2.price).to eq(5)
      expect(park3.name).to eq("Wheeler")
      expect(park3.price).to eq(15)
    end
  end

  describe "#vehicles_in_park" do
    it "starts with an emptry parking_lot array" do
      park1 = Park.new("Underwood", 10)
      park2 = Park.new("Washburn", 5)
      park3 = Park.new("Wheeler", 15)
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(park1.parking_lot).to eq([])
      expect(park2.parking_lot).to eq([])
      expect(park3.parking_lot).to eq([])
    end

    it "lists the vehicles that have entered the park" do
      park1 = Park.new("Underwood", 10)
      park2 = Park.new("Washburn", 5)
      park3 = Park.new("Wheeler", 15)
      vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle2 = Vehicle.new("2001", "Honda", "Civic")
      vehicle3 = Vehicle.new("2001", "Honda", "Civic")

      vehicle1.enter_park
      park1.vehicles_in_park(vehicle1)
      vehicle2.enter_park
      park1.vehicles_in_park(vehicle2)
      vehicle3.enter_park
      park3.vehicles_in_park(vehicle3)

      expect(park1.parking_lot).to eq([vehicle1, vehicle2])
      expect(park2.parking_lot).to eq([])
      expect(park3.parking_lot).to eq([vehicle3])
    end
  end

  describe "#passengers_in_park" do
    it "listes the passengers that entered the park" do
      park1 = Park.new("Underwood", 10)
      park2 = Park.new("Washburn", 5)
      park3 = Park.new("Wheeler", 15)
      vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle2 = Vehicle.new("2001", "Honda", "Civic")
      vehicle3 = Vehicle.new("2001", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle1.add_passenger(charlie)
      vehicle1.add_passenger(jude)
      vehicle3.add_passenger(taylor)

      expect(vehicle1.passengers).to eq([charlie, jude])
      expect(vehicle2.passengers).to eq([])
      expect(vehicle3.passengers).to eq([taylor])

      vehicle1.enter_park
      vehicle2.enter_park
      vehicle3.enter_park

      expect(park1.visitors).to eq([charlie, jude])
      # expect(park2.visitors).to eq([])
      # expect(park3.visitors).to eq([taylor])
    end
  end
end