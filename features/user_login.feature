Feature: Create sign in

  As a user
  So that I can sign in
  I want to sign in with my credentials

Background: user in database

    Given the following users exist:
    |       email    | password |
    | test0@test.com | 1234abcd |

Scenario: see the sign in form
  When I go to the user sign in page
  Then I should see a form for "user_email"
  Then I should see a form for "user_password"
  Then I should see a button with "Log in" 

Scenario: sign in with valid credentials
  When I go to the user sign in page
  And I sign in as a user with email "test0@test.com" and password "1234abcd"
  Then I should be on the home page
  Then I should not see a button with "Log in"

Scenario: sign in with invalid password
  When I go to the user sign in page
  And I sign in as a user with email "test0@test.com" and password "abcdefgh"
  Then I should see "Invalid email or password."

Scenario: sign in with invalid email
  When I go to the user sign in page
  And I sign in as a user with email "invalid@test.com" and password "1234abcd"
  Then I should see "Invalid email or password."

