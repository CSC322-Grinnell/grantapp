Feature: Apply button

  As an applicant user
  I want to navigate to a program
  So I can apply for funding
  
Background: user in database

    Given the following users exist:
    |       email    | password | role     |
    | appli@test.com | 1234abcd | applicant|

    Given the following programs exist:
    | title   | application_form |
    | School  | http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |



Scenario: viewing a program
  When I go to the user log in page
  And I log in as a user with email "appli@test.com" and password "1234abcd"
  Then I should be on the home page
  When I click on Show for the "School" program
  Then I should see a link to "Apply"


