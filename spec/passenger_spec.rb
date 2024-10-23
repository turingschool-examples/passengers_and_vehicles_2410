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

    it 'has attributes' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.name).to eq('Charlie')
      expect(charlie.age).to eq(18)
    end
  end

  describe '#adult?' do
    it 'returns true if passenger is 18 or older' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.adult?).to be true
    end

    it 'returns false if they are younger than 18' do
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(taylor.adult?).to be false
    end
  end

  describe '#driver?' do
    it 'will return false by default' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to be false
    end

    it 'returns true after the #drive method is called on a passenger' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to be false

      charlie.drive

      expect(charlie.driver?).to be true
    end
  end
end