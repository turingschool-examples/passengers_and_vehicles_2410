require './lib/passenger'
require './lib/vehicle'
require 'Rspec'
require 'pry'

RSpec.describe NationalPark do 
  describe "#initialization" do 
    it "exists" do 
      yosemite = NationalPark.new("Yosemite", 35)  
      expect(yosemite).to be_a(NationalPark)
      
      expect(yosemite.name).to eq("Yosemite")
      expect(yosemite.price).to eq(35)
    end
  end