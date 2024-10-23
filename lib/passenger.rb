# lib/passenger.rb
class Passenger
  # The 'attr_reader' is used to automatically create getter methods for the name and age
  attr_reader :name, :age

  # The constructor method initializes a new Passenger object.
  # It expects a hash of details which includes the name and age of the passenger.
  def initialize(details)
    @name = details["name"]  # Assigns the name from the hash
    @age = details["age"]    # Assigns the age from the hash
    @driver = false          # Initially, the passenger is not a driver
  end

  # This method checks if the passenger is an adult (age 18 or older).
  def adult?
    @age >= 18
  end

  # This method returns whether the passenger is a driver or not.
  def driver?
    @driver
  end

  # This method sets the passenger as a driver.
  def drive
    @driver = true
  end
end