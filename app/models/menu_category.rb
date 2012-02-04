class MenuCategory < ActiveRecord::Base
  has_many :menu_items
  belongs_to :restaurant
  attr_accessible :name, :restaurant_id, :menu_category_position
end
