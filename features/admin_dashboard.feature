# Creating Users from Active Admin is currently disabled
Feature: Admin Dashboard

  As an admin
  When I log in
  So I can manage users

Background: admin exists
  Given the following admins exist:
  | email           | password |
  | admin@admin.com | 1234abcd |

Scenario: admin dashboard
  When I go to the admin log in page
  And I fill form for "admin_user_email" with "admin@admin.com"
  And I fill form for "admin_user_password" with "1234abcd"
  And I press "Login"
  And I click "Users"
  #And I click "New User"
  Then I should see a field for "user_email"
  Then I should see a field for "user_first_name"
  Then I should see a field for "user_last_name"
  Then I should see a field for "user_address"
  Then I should see a field for "user_role"
  Then I should see a field for "user_organization"
