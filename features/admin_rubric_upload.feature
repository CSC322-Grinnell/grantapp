Feature: Admin rubric uploads
  
  As an admin
  I want to upload a rubric with a program
  So that reviewers can score applications to that program
  
Background: Admin in database
  
Given the following admins exist:
  | email             | password |
  | admin@example.com | password |

Scenario: Upload the specifications for applying to a specific grant and a scoring rubric
  	When I go to the admin log in page
  	And I log in as an admin with email "admin@example.com" and password "password"
  	And I click "Programs"
  	And I click "New Program"
  	Then I should see a field for "Rubric"