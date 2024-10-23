require 'pry'

class Passenger
    attr_reader :name, :age, :driver

    def initialize(details)
        @name = details["name"]
        @age = details["age"]
        @driver = false
    end

    def adult?
        @age >= 18
    end

    def driver?
        @driver 
    end

    def assign_driver
        @driver = true
    end
end


