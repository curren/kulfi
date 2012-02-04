class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  attr_accessible :name, :menu_category_id, :description, :price
end
