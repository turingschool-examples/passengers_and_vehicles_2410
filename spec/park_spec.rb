require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe "#initialization" do 
        it "exists" do 
            park1 = Park.new("Yellowstone") 
            expect(park1).to be_a Park
        end

        it "created park with correct name, and addmission price" do
            park1 = Park.new("Yellowstone")
            expect(park1.name).to eq("Yellowstone")
            expect(park1.price).to eq(22)
        end
    end

    describe "#vehicle_enter_park" do
        it "confirming that no vehicles are in the park when created" do
            park1 = Park.new("Yellowstone")
            expect(park1.vehicles_entered).to eq([])
        end

        it "has vehicles after they have entered the park" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            expect(park1.vehicles_entered).to eq([])
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.vehicles_entered).to eq([vehicle1, vehicle2])
        end
    end

    describe "#passengers_in_park" do
        it "confirms that no passengers are in the park when created" do
            park1 = Park.new("Yellowstone")
            expect(park1.passengers_entered).to eq([])
        end

        it "has passengers in the park after vehicles enter" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            vehicle1.add_passenger(charlie)
            vehicle1.add_passenger(taylor)
            vehicle2.add_passenger(jude)
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.passengers_entered).to eq([charlie, taylor, jude])
        end
    end

    describe "#revenue_generated" do
        it "confirms that no revenue has been generated when the park opens" do
            park1 = Park.new("Yellowstone")
            expect(park1.revenue).to eq(0)
        end

        it "confirms the revenue generated after passengers have entered the park" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            vehicle1.add_passenger(charlie)
            vehicle1.add_passenger(taylor)
            vehicle2.add_passenger(jude)
            expect(park1.revenue).to eq(0)
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.revenue).to eq(44)
        end
    end

    describe "#all_attendees" do
        it "confirms all attendees of the park for the day" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            vehicle1.add_passenger(charlie)
            vehicle1.add_passenger(taylor)
            vehicle2.add_passenger(jude)
            expect(park1.revenue).to eq(0)
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.all_attendees).to eq(["Charlie", "Jude", "Taylor"])
        end
    end

    describe "#all_adults" do
        it "confirms all the attendees that were adults of the park for the day" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            vehicle1.add_passenger(charlie)
            vehicle1.add_passenger(taylor)
            vehicle2.add_passenger(jude)
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.all_adults).to eq(["Charlie", "Jude"])
        end
    end

    describe '#all_minors' do
        it "confirms all the attendees that were minors of the park for the day" do
            park1 = Park.new("Yellowstone")
            vehicle1 = Vehicle.new("2001", "Honda", "Civic")
            vehicle2 = Vehicle.new("2013", "Lexus", "IS250")
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
            john = Passenger.new({"name" => "John", "age" => 14})
            vehicle1.add_passenger(charlie)
            vehicle1.add_passenger(taylor)
            vehicle2.add_passenger(jude)
            vehicle2.add_passenger(john)
            park1.vehicle_enter_park(vehicle1)
            park1.vehicle_enter_park(vehicle2)
            expect(park1.all_minors).to eq(["John", "Taylor"])
        end
    end
end