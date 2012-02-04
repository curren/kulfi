class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :menu_category_id
      t.string :description
      t.decimal :price, :precision => 6, :scale => 2

      t.timestamps
    end
  end
end
