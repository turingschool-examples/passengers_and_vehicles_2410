require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do 
  describe "#initialization" do 
    it "exists" do 
    end
  end
end