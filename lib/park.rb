class Park
    attr_reader :name,
                :price,
                :vehicles_entered,
                :passengers_entered,
                :revenue

    def initialize(name)
        @name = name
        @price = 22
        @vehicles_entered = []
        @passengers_entered = []
        @revenue = 0
    end

    def vehicle_enter_park(vehicle)
        @vehicles_entered << vehicle

        vehicle.passengers.each do |passenger|
            @passengers_entered << passenger
        end

        vehicle.passengers.each do |passenger|
            if passenger.adult? == true
                @revenue += @price
            end
        end
    end

    def all_attendees
        all_visitors = passengers_entered.map do |passenger|
            passenger.name
        end.sort
    end

    def all_adults
        all_adult_visitors = passengers_entered.select do |passenger|
            passenger.adult?
        end
        all_adult_names = all_adult_visitors.map do |passenger|
            passenger.name
        end.sort
    end

    def all_minors
        all_minor_visitors = passengers_entered.select do |passenger|
            passenger.adult? == false
        end
        all_minor_names = all_minor_visitors.map do |passenger|
            passenger.name
        end.sort
    end
end