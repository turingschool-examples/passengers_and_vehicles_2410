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

    vehicle.passengers.each do |passenger|
      add_passenger(passenger)
    end
  end

  def add_passenger(passenger)
    @entered_passengers << passenger

    if passenger.adult?
      generate_revenue
    end
  end

  def generate_revenue
    @revenue += @admission
  end

  def list_everyone
    everyone = []

    @entered_passengers.each do |passenger|
      everyone << passenger.name
    end

    everyone.sort
  end

  def list_minors
    minors = []

    @entered_passengers.each do |passenger|
      if !passenger.adult?
        minors << passenger.name
      end
    end

    minors.sort
  end

  def list_adults
    adults = []

    @entered_passengers.each do |passenger|
      if passenger.adult?
        adults << passenger.name
      end
    end

    adults.sort
  end
end