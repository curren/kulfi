Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

When /^I go to the list of restaurants$/ do
   visit restaurants_path
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Given /^I have no restaurants$/ do
  Restaurant.delete_all
end

Given /^I am on the list of restaurants$/ do
  visit restaurants_path
end

When /^I follow "([^"]*)"$/ do |arg1|
  visit new_restaurant_path
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, :with=> value
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should have ([0-9]+) restaurants?$/ do |count|
  Restaurant.count.should == count.to_i
end



