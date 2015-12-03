Feature: Reviewer responses
  As a reviewer
  I want to be able to add comments and assign scores to applications
  So that I remember what I thought of apps when I want to discuss them
  
Background: reviewer and applications for an assigned program exist
  
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

Scenario: Adding Comments
    When I go to the user log in page
    And I log in as a user with email "reviewer@example.com" and password "abc123abc123"
    And I go to the apps page
    And I link "Review"
    Then I should be on reviews new
    When I fill in "comments" with "foo"
    And I link "Submit"
    Then I should be on apps page
    And I should see that the "comments" field contains "foo"