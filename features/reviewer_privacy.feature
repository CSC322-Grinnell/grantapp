Feature: Reviewer Privacy

  As a reviewer
  I should only be able to access the applications 
  So I am assigned to so I don't invade the privacy of others.

Background: reviewer exists
 
    

     Given the following programs exist:
    | title |  application_form |
    | football |  http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf |
    | soccer |  http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf |

    Given the following users exist:
    |       email           | password     | role      | program |
    | applicant@gmail.com   | abc123abc123 | applicant |  |
    | applicant2@gmail.com  | abc123abc123 | applicant | |
    | reviewer@example.com  | abc123abc123 | reviewer  | football |


      Given the following apps exist:
    |       user           | program  |application_forms |
    | applicant@gmail.com  | football | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |
    | applicant2@gmail.com | soccer   | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |


Scenario: Reviewer Privacy
  When I go to the user log in page
  And I log in as a user with email "reviewer@example.com" and password "abc123abc123"
  And I go to the apps page
  Then I should see all applications with program "football" 
