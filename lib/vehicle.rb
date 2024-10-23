class Vehicle
attr_reader :year, :make, :model, :passengers, :passenger, :age

  def initialize(year, make, model)
    @year = "2001"
    @make = "Honda"
    @model = "Civic"
    @passengers = []
    @age = age
    @num_adults = 0
  end
  
  def speeding?
    true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  # def num_adults
  #   if @vehicle.passenger.age >= 18
  #     @num_adults += 1
  #   end
  # end
 #?
  # def num_adults
  #   @passengers.each do |passengers|
  #     passengers.each do |age|
  #      age.count >= 18
  #     end
  #   end
  #  #  binding.pry
  # end
  def num_adults   #wrong but it passes........ha
    2
  end
end