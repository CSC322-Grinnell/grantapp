Feature: Admin rubric and application form uploads
  
  As an admin
  I want to upload an application and rubric with a program
  So that reviewers can score applications to that program
  and so that applicants can access application
  
Background: Admin in database
  
Given the following admins exist:
  | email             | password |
  | admin@example.com | password |


# Given the following programs exist:
#     | title   | application_form  | rubric |
#     | football| hello.pdf         | ch.pdf |
#     | music   | plz.pdf           | t.odt |
  

Scenario: Upload the specifications for applying 
  to a specific grant and a scoring rubric
  	When I go to the admin log in page
  	And I log in as an admin with email "admin@example.com" and password "password"
  	And I click "Programs"
  	And I click "New Program"
  	And I upload a file called "genapp.pdf" to rubric
  	And I upload a file called "genapp.pdf" to application form
  	And I click "Create Program"
  	Then I should see "genapp.pdf"
  	
  	
#   	Then I should see a field for "Rubric"
  	
  	
# Scenario: Upload the specifications for applying 
#   to a specific grant and a scoring rubric
#   	When I go to the rubric upload page for the football program
#   	And I upload a rubric to the football program
#   	Then 
  	