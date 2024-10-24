require "./lib/passenger"
require "./lib/vehicle"

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do 
  describe "instantiation" do 
    it "exists" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")  
      expect(vehicle).to be_a Vehicle
    end

    it "has a year, make, and model" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")  

      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq "Honda"
      expect(vehicle.model).to eq "Civic"
    end
  end
end