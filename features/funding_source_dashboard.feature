Feature: Funding Source Dashboard

  As a funding source
  When I log in
  So that I can see a list of options I have


Background: funding source in database

  Given the following funding sources exist:
  | email        | password |      role      |
  | fs@admin.com | 1234abcd | Funding Source |

Scenario: funding source dashboard
  When I go to the user log in page
  And I log in as a user with email "fs@admin.com" and password "1234abcd"
  Then I should be on dashboard
  Then I should see a disabled button with "Review Applications"
  Then I should see a disabled button with "Approve Applications"

Scenario: funding source log in with invalid credentials
  When I go to the user log in page
  And I log in as a user with email "fs0@admin.com" and password "987654321"
  Then I should see "Invalid email or password."
