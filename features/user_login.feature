Feature: Create login

  As a user
  So that I can login
  I want to login with my credentials

Background: user in database

    Given the following users exist:
    |       email    | password |
    | test0@test.com | 1234abcd |

Scenario: see the log in form
  When I go to the user log in page
  Then I should see a form for "user_email"
  Then I should see a form for "user_password"
  Then I should see a button with "Log in" 

Scenario: log in with valid credentials
  When I go to the user log in page
  And I log in as a user with email "test0@test.com" and password "1234abcd"
  Then I should be on the home page

Scenario: log in with invalid password
  When I go to the user log in page
  And I log in as a user with email "test0@test.com" and password "abcdefgh"
  Then I should see "Invalid email or password."

Scenario: log in with invalid email
  When I go to the user log in page
  And I log in as a user with email "invalid@test.com" and password "1234abcd"
  Then I should see "Invalid email or password."

