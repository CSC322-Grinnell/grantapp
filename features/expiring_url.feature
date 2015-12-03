Feature: Expiring URL
  
Scenario: 
  As a user,
  I want my applications to be secure and not easily accessible by a URL
  So that my information is confidential.
  
  
Background: 
  
  Given The following users exist:
    
     |       email    | password | role     |
    | appli@test.com | 1234abcd | applicant|
    | revie@test.com | password | reviewer | 

 Given the following programs exist:
    |     title | id |application_form |
    | School    | 1  |http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |

Scenario: downloading an application_forms
   When I go to the user log in page
   And I log in as a user with email "appli@test.com" and password "1234abcd"
   And I link "Download"
   Then I should get a download with the filename "document"
            