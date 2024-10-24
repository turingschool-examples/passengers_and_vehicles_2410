require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
    end

    it "has a name" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.name).to eq "Charlie"
    end

    it "has an age" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.age).to eq 18
    end
  end 

  it "#adult?" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
      
      expect(charlie.adult?).to be true
      expect(taylor.adult?).to be false
  end

  describe "#drive" do 
    it "can change driver? attribute" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  

      expect(charlie.driver?).to be false 

      charlie.drive

      expect(charlie.driver?).to be true 
    end
  end
end