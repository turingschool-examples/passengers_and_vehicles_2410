
class Passenger
  attr_reader :name, :age

  def initialize(attributes = {})
    @name = attributes["name"]
    @age = attributes["age"]
    @driver = false
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