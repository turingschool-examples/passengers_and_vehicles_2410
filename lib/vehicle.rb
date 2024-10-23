# lib/vehicle.rb
class Vehicle
  # Creating getter methods for year, make, model, and passengers attributes
  attr_reader :year, :make, :model, :passengers

  # Constructor initializes a vehicle with year, make, model
  # Initializes @speeding as false (vehicle is not speeding by default)
  # Initializes @passengers as an empty array to hold Passenger objects
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
  end

  # Method to check if the vehicle is speeding
  def speeding?
    @speeding
  end

  # Method to set the vehicle to speeding
  def speed
    @speeding = true
  end

  # Method to add a passenger to the vehicle's passengers array
  def add_passenger(passenger)
    # Passenger object is added to the passengers array
    @passengers << passenger
  end

  # Method to count the number of adult passengers in the vehicle
  def num_adults
    # Uses count method with a block to filter passengers who are adults (age >= 18)
    @passengers.count { |passenger| passenger.adult? }
  end
end
