require 'pry'

class Park
    attr_reader :name, :price, :vehicles_list

    def initialize(name, price)
        @name = name
        @price = price
        @vehicles_list = []
    end

    def add_vehicle(vehicle)
        @vehicles_list << vehicle
    end

    def entered_vehicles
        @vehicles_list
    end

    def entered_passengers

        
    end
end