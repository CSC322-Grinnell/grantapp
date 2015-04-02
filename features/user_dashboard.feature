Feature: User Dashboard

  As a funding source
  When I log in
  So that I can see a list of options I have


Background: Users in database

  Given the following users exist:
  | email            | password |      role      |
  | admin@admin.com  | 1234abcd | Admin          |
  | fs@admin.com     | 1234abcd | Funding Source |
  | review@admin.com | 1234abcd | Reviewer       |
  | app@admin.com    | 1234abcd | Application    |


Scenario: admin dashboard
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  Then I should be on dashboard
  Then I should see a disabled button with "Review Applications"
  Then I should see a button with "Create New Programs"
  Then I should see a disabled button with "Approve Applications"
  Then I should see a button with "View Programs"


Scenario: reviewer dashboard
  When I go to the user log in page
  And I log in as a user with email "review@admin.com" and password "1234abcd"
  Then I should be on dashboard
  Then I should see a disabled button with "Review Applications"

@wip
Scenario: applicant dashboard
  When I go to the user log in page
  And I log in as a user with email "app@admin.com" and password "1234abcd"
  Then I should be on dashboard
  Then I should see a button with "New Application"
  Then I should see a button with "My Applications"

Scenario: Log in with invalid credentials
  When I go to the user log in page
  And I log in as a user with email "yoo@admin.com" and password "1234abcd"
  Then I should see "Invalid email or password."
