class Passenger
  attr_reader :name, :age, :driver

  def initialize(passenger_details)
    @name = passenger_details[:name]
    @age = passenger_details[:age]
    @driver = passenger_details[:driver]
    @driver = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end