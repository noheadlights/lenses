Feature: Entering lens data
  In order to fill the application with data
  As an Admin
  I want to be able to enter the lens data easily

  Scenario:
    Given I am logged in
    And the Test Lense doesn't exist
    And I click on "New Lense"
    And I select "Canon" from "Brand"
    And I select "Normal" from "Lense type"
    And I fill in "Max aperture" with "6.3"
    And I fill in "Minimum Aperture" with "3.5"
    And I fill in "Maximum Focal Length" with "100"
    And I fill in "Minimum Focal Length" with "50"
    And I fill in "Lens Name" with "EF-Test"

    And I click on "Create Lense"
    And I should see "Lense was successfully created."
    And I should see "Listing lenses"

