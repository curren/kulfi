Feature: Manage Restaurants
  In order to create a restaurant app
  As an admin
  I want to create and manage restaurants
  
  Scenario: Restaurant List
    Given the following restaurant records 
      | name |  
      | Moxies    |
      | Shalimar  |  
    When I go to the list of restaurants
    Then I should see "Moxies"
    And I should see "Shalimar"
    

