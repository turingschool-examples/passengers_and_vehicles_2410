require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe '#initialization' do
        it 'exists' do
            park1 = Park.new('Shenandoah', 20)
            
            expect(park1).to be_a Park
        end
    end
end

