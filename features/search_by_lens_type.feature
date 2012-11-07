Feature: search lenses by type
  In order to find a lens
  As a User
  I want to be able to search by lens type

Scenario Outline: Search lens Type
  Given I am on the homepage
  When I select a "<lensetype>"
  Then I should see "<lens>"
  And I should not see "<no_lens>"

Scenarios:
  | lensetype  | lens       | no_lens |
  | Telezoom  | EFS 55-250 |  EF 50 1.8 |
  | Ultrawide | EF 10-20   | EFS 55-250 |
  | Wideangle | EFS 18-55  | EFS 55-250 |
  | Normal    | EF 50 1.8  | EFS 55-250 |


