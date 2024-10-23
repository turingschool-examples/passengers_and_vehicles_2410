class Park
  attr_reader :name, 
              :admission, 
              :admitted_vehicles, 
              :admitted_passengers

  def initialize(park_data)
    @name = park_data["name"]
    @admission = park_data["admission"]
    @admitted_vehicles = []
    @admitted_passengers = []
  end

  def admit_vehicle(vehicle)
    @admitted_vehicles << vehicle
  end
  
end