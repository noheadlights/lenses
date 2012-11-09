Feature: Entering lens data
  In order to do administrative tasks
  As an Admin
  I want to be able to login with a username and password

  Scenario:
    Given I am on the homepage
    And I am not logged in
    And I click on "Admin Login"
    And I enter login and password
    And I click on "Sign in"
    Then I should see "Hello Adminuser"
    Then I should see "New Lense"


