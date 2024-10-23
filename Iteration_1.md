# Passengers and Vehicles Instructions

## Iteration 1
Use TDD to create a `Passenger` class that responds to the following interaction pattern. For the `adult?` method, a `Passenger` is considered an adult if they are age 18 or older.

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