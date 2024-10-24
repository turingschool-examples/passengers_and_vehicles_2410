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

  it "can speed" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")  

      expect(vehicle.speeding?).to be false 

      vehicle.speed 

      expect(vehicle.speeding?).to be true 
  end

  it "can add passengers" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")  
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

      expect(vehicle.passengers).to eq([])

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.passengers).to eq([charlie, jude, taylor])
  end

  it "can give count of adults" do 
    vehicle = Vehicle.new("2001", "Honda", "Civic")  
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    jude = Passenger.new({"name" => "Jude", "age" => 20})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    expect(vehicle.num_adults).to eq 2
  end
end