require 'bike.rb'

describe Bike do 
    let(:bike) {Bike.new}
    it 'responds to working? method' do 
        
        expect(bike).to respond_to(:broken)
    end 
    it 'tracks if a bike is working' do 
        expect(bike.broken).to eq(false)
    end

    it 'tracks if a bike is broken' do 
        bike.broken = true
        expect(bike.broken).to eq(true)
    end
end