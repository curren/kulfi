ActiveAdmin.register Restaurant do
  show :title => :name do |restaurant|
    attributes_table do
      row :name
      row :address
      row :image do
        url = "http://maps.googleapis.com/maps/api/staticmap"
        params="?center=#{restaurant.latitude},#{restaurant.longitude}&markers=color:red|#{restaurant.latitude},#{restaurant.longitude}&zoom=15&size=400x400&sensor=false"
        image_tag("#{url}#{params}")
      end
      
      table_for restaurant.menu_categories do |menu_category|
        column :name
        column :menu_category_position
      end 
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :address
      
    f.inputs "Menu" do  
        f.has_many :menu_categories do |menu_category|
          menu_category.input :name
          menu_category.input :menu_category_position
          
          menu_category.has_many :menu_items do |menu_item|
            menu_item.input :name
            menu_item.input :description
            menu_item.input :price
          end
        end
      end
      f.buttons
    end
  end
    
end
