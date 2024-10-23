require './lib/passenger'
require 'pry'
require 'rspec'


RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
      expect(@charlie).to be_a Passenger
      expect(@taylor).to be_a Passenger 
    end

    it "passenger has attributes" do 
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

    
      expect(@charlie.name).to be_a(String)
      expect(@charlie.age).to be_a(Integer)
      expect(@taylor.name).to be_a(String)
      expect(@taylor.age).to be_a(Integer)
    end

    it "checks to see if adult?" do
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

      expect(@charlie.adult?).to be(true)
      expect(@taylor.adult?).to be(false)
    end

    it "checks to see if charlie can drive" do
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

      expect(@charlie.driver?).to be(true)
    end
  end
end