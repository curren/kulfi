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
    
  Scenario: Create Valid Restaurant
    Given I have no restaurants
    And I am on the list of restaurants
    When I follow "New Restaurant"
    And I fill in "Name" with "Moxies"
    And I fill in "Address" with "159 York Boulevard, Richmond Hill"
    And I press "Create Restaurant"
    Then I should see "Restaurant was successfully created."
    And I should see "Moxies"
    And I should see "159 York Boulevard, Richmond Hill"
    And I should have 1 restaurant
