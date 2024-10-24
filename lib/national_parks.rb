# class NationalPark
#     attr_reader :name, :admission_fee, :parking_lot
  
#     def initialize(details)
#       @national_park = NationalPark.new(details)
#       @name = details["name"]
#       @admission_fee = details["admission_fee"]
#       @parking_lot = ParkingLot.new # Automatically creates a parking lot for the national park
#     end
  
#     def list_vehicles
#       @parking_lot.list_vehicles
#     end
  
#     def add_vehicle(vehicle)
#       @parking_lot.add_vehicle(vehicle)
#     end
  
#     def remove_vehicle
#       @parking_lot.remove_vehicle
#     end
  
#     def vehicle_count
#       @parking_lot.vehicle_count
#     end
#   end
  
#   class ParkingLot
#     attr_accessor :vehicles
  
#     def initialize
#       @vehicles = []
#     end
  
#     def vehicle_count
#       @vehicles.length 
#     end
  
#     def add_vehicle(vehicle)
#       @vehicles << vehicle
#     end
  
#     def remove_vehicle
#       @vehicles.pop
#     end
  
#     def list_vehicles
#       @vehicles.each do |vehicle|
#         puts "#{vehicle.license_plate}, #{vehicle.make}, #{vehicle.model}, #{vehicle.year}"
#       end
#     end
#   end

class NationalPark
    attr_reader :name, :admission_price, :vehicles, :passengers
    def initialize(name, admission_price)
        @name = name
        @admission_price = admission_price
        @vehicles = []
        @passengers = []
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
        vehicle.passengers.each do |passenger|
            @passengers << passenger
        end
    end

    def total_revenue
        total = 0
        passengers.each do |passenger|
            if passenger.adult?
                total += 35
            end
        end
        total
    end
end
   