Feature: File uploads for apps

As an applicant
I want to upload a formatted text file
So that my app can be reviewed in its intended format

Background: user, reviewer and program in db
 Given the following programs exist:
    | title   | application_form |
    | football| http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |

 Given the following users exist:
    |       email          | password     | role      | program |
    | applicant@gmail.com  | abc123abc123 | applicant |         |
    | reviewer@example.com | abc123abc123 | reviewer  |football |
 


 Scenario: User uploads an app 
 	When I go to the user log in page
  	And I log in as a user with email "applicant@gmail.com" and password "abc123abc123"
  	Given I am on the details page for "football"
    When I follow "Apply"
  	Then I should see a button with "Create App"
    And I upload a file called "genapp.pdf" to upload application
    And I press "Create App"
  	Then I should be on the apps page
  	#And I should see "http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf"
  	

