require './lib/passenger'
require './lib/vehicle'

class ParkMaker
  attr_reader :name, :admission_price, :vehicles

  def initialize(name, admission_price = 0)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def park_info
    "Park Name: #{@name}\ Admission Price: $#{@admission_price}"
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def vehicles?
    @vheicles.map do |vehicle|
      vehicle.year vehicle.make vehicle.model #Was in the middle ot writing tests to see what would come of this(did not ecpect this to work)
    end
  end
end