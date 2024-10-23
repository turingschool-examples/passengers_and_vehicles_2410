class NationalPark
    
    attr_reader :name,
                :price
                :vehicles_present
                :visitors_present

    def initialize(name, price, vehicles_count = [], visitors_count = [])
        @name = name
        @price = price
        @vehicles_count = []
        @visitors_count = []
    end

    # def visitors_present
    #     @visitors_count #passegers to go into this array


end

