require 'pry'

class Passenger
    attr_reader :name, :age, :driver

    def initialize(hash)
        @name = hash["name"]
        @age = hash["age"]
        @driver = false
    end

    def adult?
        if @age >= 18
            return true
        else
            return false
        end
    end

    def driver?
        @driver
    end

    def drive
        if @driver == false && @age >= 18
            @driver = true
        else 
            @driver = false
        end
    end
end