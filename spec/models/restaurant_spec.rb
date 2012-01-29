require 'spec_helper'

describe Restaurant do

  describe "save model to database correctly" do
    it "saves Model to database with default address" do
      restaurant = Restaurant.create!
      restaurant.name = 'Moxies'
      restaurant.address = '159 York Boulevard, Richmond Hill'
      
      restaurant.save.should == true
      
      restaurant.latitude.should == 43.84803240000000
      restaurant.longitude.should == -79.37650080000002
      restaurant.name.should == 'Moxies'
      restaurant.address.should == '159 York Boulevard, Richmond Hill'
    end
    
    it "finds the correct gps coordinates for malformed address" do
      restaurant = Restaurant.create!
      restaurant.name = 'Scaramouche'
      restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'
      
      restaurant.save.should == true
      
      restaurant.latitude.should == 43.6818435
      restaurant.longitude.should == -79.4003078
    end
  end

end

