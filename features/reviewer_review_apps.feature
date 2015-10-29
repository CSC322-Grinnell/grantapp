Feature: Reviewer review applications

  As a reviewer, 
  I want to download a specific application that I am assigned to
  so that the application can be viewed and evaluated.


  Background: 

    Given the following programs exist:
    | title |  short_description | long_description | deadline | picture | tags |
    | football | | | | | |
    | soccer | | | | | |

    Given the following users exist:
    |       email           | password     | role      | program |
    | applicant@gmail.com   | abc123abc123 | applicant |  |
    | applicant2@gmail.com  | abc123abc123 | applicant | |
    | reviewer@example.com  | abc123abc123 | reviewer  | football |


      Given the following apps exist:
    |       user           | program  | text           |
    | applicant@gmail.com  | football | applicant app  |
    | applicant2@gmail.com | soccer   | applicant2  app|


  Scenario: Reviewer Privacy
  When I go to the user log in page
  And I log in as a user with email "reviewer@example.com" and password "abc123abc123"
  And I go to the apps page
  And I link "Download"
  Then I should get a download with the filename "document"

