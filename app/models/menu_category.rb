class MenuCategory < ActiveRecord::Base
  has_many :menu_items
  belongs_to :restaurant
  accepts_nested_attributes_for :menu_items
  attr_accessible :name, :restaurant_id, :menu_category_position, :menu_items_attributes
end
