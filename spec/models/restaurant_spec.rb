require 'spec_helper'

describe Restaurant do

  describe "Saving restaurants" do
    it "should geocode address and save to database" do
      restaurant = Restaurant.new
      restaurant.name = 'Moxies'
      restaurant.address = '159 York Boulevard, Richmond Hill'

      Restaurant.count.should == 0
      restaurant.save.should == true
      Restaurant.count.should == 1

      saved_restaurant = Restaurant.first
      saved_restaurant.name.should == 'Moxies'
      saved_restaurant.address.should == '159 York Boulevard, Richmond Hill'
      saved_restaurant.latitude.should == 43.84803240000000
      saved_restaurant.longitude.should == -79.37650080000002
    end

    it "find the correct gps coordinates for different address format" do
      restaurant = Restaurant.new
      restaurant.name = 'Scaramouche'
      restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'

      Restaurant.count.should == 0
      restaurant.save.should == true
      Restaurant.count.should == 1

      saved_restaurant = Restaurant.first
      saved_restaurant.latitude.should == 43.6818435
      saved_restaurant.longitude.should == -79.4003078
    end

    it "update gps coordinates when address is changed" do
      restaurant = Restaurant.new
      restaurant.name = 'Moxies'
      restaurant.address = '159 York Boulevard, Richmond Hill'

      Restaurant.count.should == 0
      restaurant.save.should == true
      Restaurant.count.should == 1

      saved_restaurant = Restaurant.first
      saved_restaurant.latitude.should == 43.84803240000000
      saved_restaurant.longitude.should == -79.37650080000002

      saved_restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'
      saved_restaurant.save.should == true
      Restaurant.count.should == 1

      updated_restaurant = Restaurant.first
      updated_restaurant.latitude.should == 43.6818435
      updated_restaurant.longitude.should == -79.4003078
    end
  end

  describe "Restaurant validation" do
    it "should throw an error when restaurant name is nil" do
      restaurant = Restaurant.new
      restaurant.name = nil
      restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'

      restaurant.save.should == false
      Restaurant.count.should == 0
    end

    it "should throw an error when restaurant name is an empty string" do
      restaurant = Restaurant.new
      restaurant.name = ''
      restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'

      restaurant.save.should == false
      Restaurant.count.should == 0
    end

    it "should throw an error when address is incorrect" do
      restaurant = Restaurant.new
      restaurant.name = 'Spring Rolls'
      restaurant.address = 'kulfi_wrong_address'

      restaurant.save.should == false
      Restaurant.count.should == 0
    end

    it "should throw an error when address is incorrectly updated" do
      restaurant = Restaurant.new
      restaurant.name = 'Spring Rolls'
      restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'

      restaurant.save.should == true
      Restaurant.count.should == 1

      saved_restaurant = Restaurant.first
      saved_restaurant.address.should == '1 Benvenuto Pl, Toronto, ON, M4V'
      saved_restaurant.latitude.should == 43.6818435
      saved_restaurant.longitude.should == -79.4003078

      saved_restaurant.address = 'kulfi_wrong_address'
      saved_restaurant.save.should == false
      Restaurant.count.should == 1

      saved_restaurant = Restaurant.first
      saved_restaurant.address = '1 Benvenuto Pl, Toronto, ON, M4V'
      saved_restaurant.latitude.should == 43.6818435
      saved_restaurant.longitude.should == -79.4003078
    end
  end
end
