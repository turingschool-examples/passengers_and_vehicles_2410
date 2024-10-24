require './lib/park'

RSpec.describe Park do 
    describe "instantiation" do
        # three tests: exists, .name, .admission_price. We will initialize with 2 parameters
        it "exists" do 
            park = Park.new("Great Sand Dunes", 25)
            expect(park).to be_a(Park)
        end
    end
end