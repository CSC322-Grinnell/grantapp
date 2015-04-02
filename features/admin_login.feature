Feature: Admin login

  As an admin
  So that I can log in
  I want to login with my credentials


Background: admins in database

  Given the following admins exist:
  | email           | password |
  | admin@admin.com | 1234abcd |

Scenario: admin login
  When I go to the admin log in page
  Then I should see a form for "admin_user_email"
  Then I should see a form for "admin_user_password"
  Then I should see a button with "Login"

Scenario: log in with invalid password
  When I go to the admin log in page
  And I log in as an admin with email "test0@test.com" and password "abcdefg"
  Then I should see "Invalid email or password."

Scenario: log in with invalid email
  When I go to the admin log in page
  And I log in as an admin with email "invalid@test.com" and password "abcdefg"
  Then I should see "Invalid email or password."

Scenario: log in with valid email and password
  When I go to the admin log in page
  And I log in as an admin with email "admin@admin.com" and password "1234abcd"
  Then I should be on admin dashboard
