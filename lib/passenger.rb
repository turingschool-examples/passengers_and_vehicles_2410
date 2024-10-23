class Passenger
 attr_reader :name, :age

  def initialize(passenger_details)
    @name = passenger_details["name"]
    @age = passenger_details["age"]
    
    # binding.pry
  end

  def adult?
    if @age >= 18
      true
    else
      false
    end
  end

  def driver?
    if @age >= 16
      true
    else
     false
    end
  end
end