require 'spec_helper'

RSpec.describe Vehicle do 
    describe "#initialization" do 
        it "exists" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle).to be_a Vehicle
        end
    end

    describe "#passengers" do
        it "returns an empty array" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.passengers).to eq []
        end
    end

    describe "#add_passenger" do
        it "adds a passenger to the list of passengers" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            jude = Passenger.new({"name" => "Jude", "age" => 20})

            
            vehicle.add_passenger(charlie)
            vehicle.add_passenger(taylor)
            vehicle.add_passenger(jude)
            expect(vehicle.passengers).to eq [charlie, taylor, jude]
        end
    end

    describe "#speeding?" do
        it "returns true if the vehicle is speeding" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            expect(vehicle.speeding?).to eq false
        end
    end
    
    describe "#num_adults" do
        it "returns the number of adult passengers" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            jude = Passenger.new({"name" => "Jude", "age" => 20})

            vehicle.add_passenger(charlie)
            vehicle.add_passenger(taylor)
            vehicle.add_passenger(jude)
            expect(vehicle.num_adults).to eq 2

        end
    end
end