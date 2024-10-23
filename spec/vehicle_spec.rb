require './lib/vehicle'
require './lib/passenger'
require 'Rspec'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
  end

Rspec.describe Vehicle do
    describe "#initialization" do
      it "exists" do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle).to be_an_instance_of(Vehicle)
      end
      
      it 'has a year' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle.year).to eq("2001")
      end

      it 'has a make' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle.make).to eq("Honda")
      end

      it 'has a model' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle.model).to eq("Civic")
      end

      
    end

    describe "#speeding" do
        it "#tests if driver is speeding" do
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        expect(vehicle.speeding?).to eq(false)

        vehicle.speed

        expect(vehicle.speeding?).to eq(true)
        end
    end

    describe "#passengers" do
        it 'has the ability to take passengers' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            expect(vehicle.passengers).to eq([])
        end

        it "#adds passengers" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        
            vehicle.add_passenger(charlie) 
            expect(vehicle.passengers).to eq([charlie])

            vehicle.add_passenger(jude)    
            vehicle.add_passenger(taylor)
            expect(vehicle.passengers).to eq([charlie, jude, taylor])
        end

        it "#counts the number of adults" do
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
