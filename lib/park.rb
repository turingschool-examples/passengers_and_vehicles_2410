class Park
  attr_reader :name, 
              :admission, 
              :admitted_vehicles, 
              :admitted_passengers,
              :revenue

  def initialize(park_data)
    @name = park_data["name"]
    @admission = park_data["admission"]
    @admitted_vehicles = []
    @admitted_passengers = []
    @revenue = 0.00
  end

  def admit_vehicle(vehicle)
    @admitted_vehicles << vehicle

    passengers = vehicle.passengers 
    admit_passengers(passengers)
    calculate_revenue
  end

  def admit_passengers(passengers)
    passengers.each do |passenger|
      @admitted_passengers << passenger.name
    end
  end

  def calculate_revenue
    @revenue += 30.00
  end
end