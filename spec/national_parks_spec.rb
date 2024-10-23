require 'spec_helper'

RSpec.describe NationalPark do
    describe '#initialize' do
        it 'exists' do
            national_park = NationalPark.new(details)
            expect(NationalPark.new).to be_a NationalPark
        end
    end

    describe '#details' do
        xit 'returns the details of the national park' do
            Olympics = NationalPark.new(details)
                details = {
                "name" => "Olympic",
                "admission_fee" => 35
            }            
            expect(olympics).to be_a NationalPark
            expect(olympics.name).to eq("Olympic")
            expect(olympics.admission_price).to eq(35)
            zion = NationalPark.new(details)           
                details = {
                "name" => "Zion",
                "admission_fee" => 20
            }            
            expect(zion).to be_a NationalPark
            expect(zion.name).to eq("Zion")
            expect(zion.admission_price).to eq(20)
            grand_canyon = NationalPark.new(details)
                details = {
                "name" => "Grand Canyon",
                "admission_fee" => 30
            }            
            expect(grand_canyon).to be_a NationalPark
            expect(grand_canyon.name).to eq("Grand Canyon")
            expect(grand_canyon.admission_price).to eq(30)
        end
    end

    describe '#parking_lot' do
        xit 'returns the parking lot' do
            parking_lot = ParkingLot.new
            expect(parking_lot).to be_an_instance_of(ParkingLot)
        end
    end

    describe "#vehicle_count" do
        xit "returns the number of vehicles" do
            national_park = NationalParks.new
            expect(national_park.vehicle_count).to eq 0
        end
    end

    describe "#add_vehicle" do
        xit "adds a vehicle to the list of vehicles" do
            vehicle1 = Vehicle.new("Toyota", "Tacoma", "ABC-123")
            vehicle2 = Vehicle.new("Honda", "Pilot", "XYZ-789")
            vehicle3 = Vehicle.new("Ford", "Mustang", "QWE-456")
        end
    end

    describe "#remove_vehicle" do
        xit "removes a vehicle from the list of vehicles" do
            vehicle1 = Vehicle.new("Toyota", "Corolla", "ABC-123")
            vehicle2 = Vehicle.new("Honda", "Civic", "XYZ-789")
            vehicle3 = Vehicle.new("Ford", "Mustang", "QWE-456")
        end
    end
end


