require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  describe "#initialization" do 
    it "exists" do   
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle).to be_a Vehicle
      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  describe "speeding?" do
    it "verifies speeding default is false" do
      vehicle = Vehicle.new("2001", "Honda", "Cvic")
      expect(vehicle.speeding?).to eq(false)
    end
  end

  describe "speed" do
    it "changes speeding status" do
      vehicle = Vehicle.new("2001", "Honda", "Cvic")
      expect(vehicle.speeding?).to eq(false)
      vehicle.speed
      expect(vehicle.speeding?).to eq(true)
    end
  end

  describe "add_passenger" do
    it "adds array of passengers to vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Cvic")
      charlie = Passenger.new({name: 'Charlie', age: 18})
      jude = Passenger.new({name: 'Jude', age: 20})
      taylor = Passenger.new({name: 'Taylor', age: 12})
      expect(vehicle.passengers).to eq([])
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end
end