require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
    describe "#initialization" do
      it 'exists and has attributes' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")    
        
        expect(vehicle).to be_a Vehicle
        expect(vehicle.year).to eq("2001")
        expect(vehicle.make).to eq("Honda")
        expect(vehicle.model).to eq("Civic")
        expect(vehicle.speeding?).to eq(false)
        expect(vehicle.passengers).to eq([])
       end
    end

    describe "#speeding?" do
      it "returns false if initially and true after speeding" do
        vehicle = Vehicle.new("2001", "Honda", "Civic") 
        expect(vehicle.speeding?).to eq(false)

        vehicle.speed
        expect(vehicle.speeding?).to eq(true)
      end
    end

    describe "#add_passenger" do
      it "can add passengers to the vehicle" do
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
      it "can count the number of adults in the vehicle" do
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
end
