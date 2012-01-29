require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
  u.password_confirmation { |p| p.password }
end

Factory.define :restaurant do |r|
  r.name 'foo'
  r.address '159 York Boulevard, Richmond Hill'
  r.latitude 43.8480324
  r.longitude -79.3765008
end
