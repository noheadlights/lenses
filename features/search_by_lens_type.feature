Feature: search lenses by type
  In order to find a lens
  As a User
  I want to be able to search by lens type

Scenario Outline: Search lens Type
  Given I am on the homepage
  When I select a "<lenstype>"
  Then I should see "<lens>"

Scenarios:
  | lenstype  | lens       |
  | Telezoom  | EFS 55-250 |
  | Ultrawide | EF 10-20   |
  | Wideangle | EFS 18-55  |
  | Normal    | EF 50 1.8  |


