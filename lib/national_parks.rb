class NationalPark
    attr_reader :name, :admission_fee, :parking_lot
  
    def initialize(details)
      @national_park = NationalPark.new(details)
      @name = details["name"]
      @admission_fee = details["admission_fee"]
      @parking_lot = ParkingLot.new # Automatically creates a parking lot for the national park
    end
  
    def list_vehicles
      @parking_lot.list_vehicles
    end
  
    def add_vehicle(vehicle)
      @parking_lot.add_vehicle(vehicle)
    end
  
    def remove_vehicle
      @parking_lot.remove_vehicle
    end
  
    def vehicle_count
      @parking_lot.vehicle_count
    end
  end
  
  class ParkingLot
    attr_accessor :vehicles
  
    def initialize
      @vehicles = []
    end
  
    def vehicle_count
      @vehicles.length 
    end
  
    def add_vehicle(vehicle)
      @vehicles << vehicle
    end
  
    def remove_vehicle
      @vehicles.pop
    end
  
    def list_vehicles
      @vehicles.each do |vehicle|
        puts "#{vehicle.license_plate}, #{vehicle.make}, #{vehicle.model}, #{vehicle.year}"
      end
    end
  end