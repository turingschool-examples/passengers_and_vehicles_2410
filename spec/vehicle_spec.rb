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
        end

        it "a vehicle is created with a year, make, model" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.year).to eq("2001")
            expect(vehicle.make).to eq("Honda")
            expect(vehicle.model).to eq("Civic")
        end
    end

    describe "#speeding?" do
        it "confirms a vehicle isn't speeding my default" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.speeding?).to eq(false)
        end
    end

    describe "#speed" do
        it "makes the car start to speed" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.speeding?).to eq(false)
            vehicle.speed
            expect(vehicle.speeding?).to eq(true)
        end
    end

    describe "#passengers" do
        it "confirms the vehicle starts with no passengers" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.passengers).to eq([])
        end
    end

    describe "#add_passenger" do
        it "allows a vehicle to have passengers added" do
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
    end

    describe "#num_adults" do
        it "confirms that a vehicle starts with no passengers or adults" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.num_adults).to eq(0)
        end

        it "confirms the number of passengers that are adults" do
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