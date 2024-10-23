require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do 
  describe "#initialization" do 
    it "exists" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle).to be_a Vehicle
      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
      expect(vehicle.speeding?).to eq(false)
      vehicle.speed
      expect(vehicle.speeding?).to eq(true)
    end
  end
end