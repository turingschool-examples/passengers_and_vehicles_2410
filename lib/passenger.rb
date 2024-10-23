class Passenger
    attr_reader :name,
                :age

    def initialize(id_info, driver = false)
        @name = id_info["name"]
        @age = id_info["age"]
        @driver = driver
    end

    def adult?
        if @age >= 18
            true
        else
            false
        end
    end

    def driver?
        @driver
    end

    def drive
        @driver = true
    end

end