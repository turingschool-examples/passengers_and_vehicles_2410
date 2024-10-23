class NationalPark
  attr_reader :name,
              :admission,
              :entered_passengers,
              :entered_vehicles,
              :revenue

  def initialize(park_info)
    @name = park_info[:name]
    @admission = park_info[:admission]
    @entered_passengers = []
    @entered_vehicles = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @entered_vehicles << vehicle
  end
end