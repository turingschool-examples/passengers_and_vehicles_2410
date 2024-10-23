class Vehicle
  attr_reader :year, :make, :model, :passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @passengers = []
    @speeding = false
  end

  def speeding?
    @speeding
  end

  def speed
    @speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    count = 0

    @passengers.each do |passenger|
      if passenger.adult?
        count += 1
      end
    end

    count
  end
end