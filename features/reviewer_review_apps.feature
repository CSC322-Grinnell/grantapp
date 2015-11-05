Feature: Reviewer review applications

  As a reviewer, 
  I want to download a specific application that I am assigned to
  so that the application can be viewed and evaluated.


  Background: 

    Given the following programs exist:
    | title     |  application_form |
    | football  | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |
    | soccer    | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |

    Given the following users exist:
    |       email           | password     | role      | program |
    | applicant@gmail.com   | abc123abc123 | applicant |  |
    | applicant2@gmail.com  | abc123abc123 | applicant | |
    | reviewer@example.com  | abc123abc123 | reviewer  | football |


      Given the following apps exist:
    |       user           | program  | user_app |
    | applicant@gmail.com  | football | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |
    | applicant2@gmail.com | soccer   | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |


  Scenario: Reviewer Privacy
  When I go to the user log in page
  And I log in as a user with email "reviewer@example.com" and password "abc123abc123"
  And I go to the apps page
  And I link "Download"
  Then I should get a download with the filename "document"

