ActiveAdmin.register Restaurant do
  show do |restaurant|
      attributes_table do
        row :name
        row :address
        row :image do
          url = "http://maps.googleapis.com/maps/api/staticmap"
          params="?center=#{restaurant.latitude},#{restaurant.longitude}&markers=color:red|#{restaurant.latitude},#{restaurant.longitude}&zoom=15&size=400x400&sensor=false"
          image_tag("#{url}#{params}")
        end
      end
      active_admin_comments
    end
end
