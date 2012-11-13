Feature: detailed lens search with focal_lengths
  In order to search with all I know
  As a User
  I want to be able to use any minimal and maximal focal lengths

  Scenario:
    Given three example lenses are in the database
    When I am on the homepage
    And I fill in "max_focal_length" with "40"
    And I fill in "min_focal_length" with "8"

    And I click on "Search"
    Then I should see "EF 10-20"
    And I should not see "EFS 18-55"
    And I should not see "EFS 55-250"