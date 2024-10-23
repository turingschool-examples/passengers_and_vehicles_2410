# Passengers and Vehicles Instructions

## Iteration 1
Use TDD to create a `Passenger` class that responds to the following interaction pattern. For the `adult?` method, a `Passenger` is considered an adult if they are age 18 or older.

## Overview


## New Classes and Methods
**Key Points**:
- I've used attr_reader to automatically create getter methods for name and age.
- The adult? method checks if the passenger's age is 18 or older.
- The drive method sets the passenger as a driver, and driver? checks if the passenger is driving.

## Class Definition
The `Passenger` class is responsible for creating a passenger object with attributes and methods to check whether the passenger is an adult or a driver.

 - The Passenger class is defined using the class keyword. This class will represent individual passengers in our application and will contain attributes like name and age, as well as methods to check if the passenger is an adult or a driver.

```ruby
class Passenger
```

 - This line defines the Passenger class, the blueprint for creating passenger objects.

  
## Attribute Readers 
`attr_reader`
- The `attr_reader` method automatically generates getter methods for the name and age attributes. This allows other parts of the program to access these attributes without modifying them. It's a shortcut to avoid writing manual getter methods.
``` ruby
attr_reader :name, :age
```
- The `attr_reader` is used to create getter methods for the instance variables `@name` and `@age`. This allows other parts of the program to access these attributes without directly modifying them.

- `@name`: Stores the name of the passenger.
-`@age`: Stores the age of the passenger.

The getter methods allow us to use 'passenger.name' and 'passenger.age' to retrieve the values of these instance variables.


 ## Constructor (Initalization)
 #### `initialize` Method
``` ruby
def initialize(details)
  @name = details["name"]  # Assigns the name from the details hash
  @age = details["age"]    # Assigns the age from the details hash
  @driver = false          # By default, the passenger is not a driver
end
```
- The `initialize` method is a constructor that gets called when a new instance of `Passenger` is created. It expects a hash (`details`) as an argument, which contains `"name"` and `"age"`. 
- Inside the method it is is responsible for setting up the passenger's attributes when a new instance of the class is created.

- `details`: A hoad containing the passenger'sname and age.
- `@name` Assigned from details["name"].
- `@age` Assigned from details["age"].
-`@driver` is initialized as `false` because, by default, the passenger is not a driver.

- This method is called automatically when we create a new Passenger object, for example:
``` ruby
charlie= Passenger.new({"name" => "Charlie", "age" => 18})
```
 ## `adult?` Method
``` ruby
def adult?
  @age >= 18
end

```
The `adult?` method checks if the passenger's age is 18 or older. It returns a boolean value:

- `true` if the passenger is 18 or older.
- `false` if the passenger is under 18.
- This method allows us to easily check if a passenger is considered an adult.

```ruby
charlie.adult?  # returns true
taylor.adult?   # returns false
```
## `driver?` Method
``` ruby
def driver?
  @driver
end
```
The `driver?` method checks whether the passenger is currently a driver. It returns the value of the instance variable `@driver`:

- `true` if the passenger is a driver.
- `false` if the passenger is not a driver.
Initially, all passengers are not drivers (`@driver = false`).


## `drive` Method
``` ruby
def drive
  @driver = true
end
```
The `drive` method sets the passenger as a driver by changing the value of `@driver` to true. Once this method is called, the passenger is considered a driver.

Example:
``` ruby
charlie.drive    # changes charlie to a driver
charlie.driver?  # returns true

```
## Full `Passenger` Class Code
``` ruby
class Passenger
  attr_reader :name, :age

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

  def drive
    @driver = true
  end
end
```
This class encapsulates the key attributes (`name`, `age`) and behaviors (`adult?`, `driver?`, `drive`) for each passenger in the application.

**Class Updates**:
  - 

## TDD Process

## Test Failures and Fixes
1. **Test**: `rspec`
   - **Failure Reason**: Passed
Passenger
  #initialization
    exists and has attributes
  #adult?
    determines if the passenger is an adult based on age
  #driver?
    determines if the passenger is a driver and can change driving status

Finished in 0.00169 seconds (files took 0.10293 seconds to load)
3 examples, 0 failures
   - **Fix**: 

2. **Test**: 
   - **Failure Reason**: 
   - **Fix**: 


## Reflection
- **Challenges**: 
- **Successes**: 



```ruby
pry(main)> require './lib/passenger'
# => true

pry(main)> charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# => #<Passenger:0x00007fc1ad88b3c0...>

pry(main)> taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>

pry(main)> charlie.name
# => "Charlie"

pry(main)> charlie.age
# => 18

pry(main)> charlie.adult?
# => true

pry(main)> taylor.adult?
# => false

pry(main)> charlie.driver?
# => false

pry(main)> charlie.drive

pry(main)> charlie.driver?
# => true
```
# Breakdown of the New Test Cases:
### 1. Initialization Test:

- Ensures that the `Passenger` class can successfully create instances and assigns the correct attributes (`name` and `age`).
- Validates both `charlie` and `taylor` objects, ensuring that their attributes are correctly stored.

### 2. Adult Method Test:

- Tests the `adult?` method by verifying if passengers 18 years or older return `true` and passengers under 18 return `false`.

### 3. Driver Method Test:

- Checks the initial state of the `driver?` method (should be `false`).
- After calling `drive`, it ensures the `driver?` method returns `true`, indicating the passenger is now a driver.
