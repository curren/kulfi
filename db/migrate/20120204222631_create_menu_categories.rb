class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.integer :restaurant_id
      t.integer :menu_category_position

      t.timestamps
    end
  end
end
