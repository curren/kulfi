class Restaurant < ActiveRecord::Base
#  include ActiveModel::AddressValidator

  attr_accessible :name, :address, :latitude, :longitude

  geocoded_by :address
#  after_validation :geocode, :if=>:address_changed?

  validates :name, :presence => true
  validates :address, :presence => true
  validates_with AddressValidator, :if=>:address_changed?
end
