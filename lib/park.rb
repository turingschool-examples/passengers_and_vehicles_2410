class Park
    attr_reader :name, :price, :parking_lot, :visitors

    def initialize(name, price)
        @name = name
        @price = price
        @parking_lot = []
        @visitors = []
    end

    def vehicles_in_park(vehicle)
        if vehicle.enter_park == true
            @parking_lot << vehicle
        end
    end

    def passengers_in_park(vehicle)
        if vehicle.enter_park == true
           @visitors << vehicle.passengers
        end
    end
end