Feature: Manage Restaurants
  In order to create a restaurant app
  As an admin
  I want to create and manage restaurants

  Scenario: Restaurant List
    Given the following restaurant records
      | name      |
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

  Scenario: Create Unnamed Restaurant
    Given I have no restaurants
    And I am on the list of restaurants
    When I follow "New Restaurant"
    And I fill in "Name" with ""
    And I fill in "Address" with "159 York Boulevard, Richmond Hill"
    And I press "Create Restaurant"
    Then I should see "Name can't be blank"
    And I should have 0 restaurant

  Scenario: Create Restaurant with no address
    Given I have no restaurants
    And I am on the list of restaurants
    When I follow "New Restaurant"
    And I fill in "Name" with "Moxies"
    And I fill in "Address" with ""
    And I press "Create Restaurant"
    Then I should see "Address can't be blank"
    And I should have 0 restaurant

  Scenario: Create Restaurant with incorrect address
    Given I have no restaurants
    And I am on the list of restaurants
    When I follow "New Restaurant"
    And I fill in "Name" with "Moxies"
    And I fill in "Address" with "fake_kulfi_address"
    And I press "Create Restaurant"
    Then I should see "Address can't be located"
    And I should have 0 restaurant

#  TODO: Add scenarios for updating name & address with correct/incorrect values once views are finalized
