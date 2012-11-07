Feature:
  In order to not destroy stuff
  As a User
  I Should not be able to edit lenses

  Scenario Outline: Not editable as non user
    Given I am on the homepage
    And I am not logged in
    Then I should not see "<stuff>"

  Scenarios:
    | stuff     |
    | Edit      |
    | Destroy   |
    | New Lense |