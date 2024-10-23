## Iteration 2

Use TDD to create a `Vehicle` class that responds to the following interaction pattern:

## Overview


## New Classes and Methods
- **New Class**: 
  - 
  - **Methods Added**:
    - `

- ***Class Updates**:
  - 

## Test Failures and Fixes
1. **Test**:
   - **Failure Reason**: 
   - **Fix**: 

2. **Test**: 
   - **Failure Reason**: 
   - **Fix**: 

## TDD Process


## Reflection
- **Challenges**: 
- **Successes**: 

```ruby
pry(main)> require './lib/vehicle'
# => true

pry(main)> require './lib/passenger'
# => true

pry(main)> vehicle = Vehicle.new("2001", "Honda", "Civic")    
# => #<Vehicle:0x00007fe0da9c63d8...>

pry(main)> vehicle.year
# => "2001"

pry(main)> vehicle.make
# => "Honda"

pry(main)> vehicle.model
# => "Civic"

pry(main)> vehicle.speeding?
# => false

pry(main)> vehicle.speed

pry(main)> vehicle.speeding?
# => true

pry(main)> vehicle.passengers
# => []

pry(main)> charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# => #<Passenger:0x00007fe0da1ec450...>

pry(main)> jude = Passenger.new({"name" => "Jude", "age" => 20})    
# => #<Passenger:0x00007fe0da2730e0...>

pry(main)> taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>

pry(main)> vehicle.add_passenger(charlie)    

pry(main)> vehicle.add_passenger(jude)    

pry(main)> vehicle.add_passenger(taylor)    

pry(main)> vehicle.passengers
# => [#<Passenger:0x00007fe0da1ec450...>, #<Passenger:0x00007fe0da2730e0...>, #<Passenger:0x00007fe0da2cf1b0...>]

pry(main)> vehicle.num_adults
# => 2
```