Feature: detailed lens search
  In order to search with all I know
  As a User
  I want to be able to use any lens detail as a search parameter.

Scenario:
  When I am on the homepage
  And I fill in "aperture_to" with "2.8"
  And I click on "Search"
  Then I should see "EF 50 1.8"
  And I should not see "EFS 18-55"