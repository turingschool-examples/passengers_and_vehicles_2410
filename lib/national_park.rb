class NationalPark
    attr_reader :name, :admission_price, :vehicle_list
    #attr_accessor :revenue ? admission_collected ?

    def initialize(name, admission_price)
        @name = name
        @admission_price = admission_price
        @vehicles = []
    end








end