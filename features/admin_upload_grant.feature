Feature: File uploads for apps

As an admin
I want to upload an application form (.pdf/.docx) to a grant 
So that applicants can apply

Background: admin in database
  
  Given the following admins exist:
  | email             | password |
  | admin@example.com | password |

Scenario: Upload the specifications for 
  applying to a specific grant
  	When I go to the admin log in page
  	And I log in as an admin with email "admin@example.com" and password "password"
  	And I click "Programs"
  	And I click "New Program"
  	Then I should see a field for "Application"
  	

