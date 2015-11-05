Feature: Apply button

  As an applicant user
  So that I can be considered
  I want to apply to a program

Background: user in database

    Given the following users exist:
    |       email    | password | role     |
    | appli@test.com | 1234abcd | applicant|
    | revie@test.com | password | reviewer | 

    Given the following programs exist:
    |     title | id |application_form |
    | School    | 1  |http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |



Scenario: viewing a program
  When I go to the user log in page
  And I log in as a user with email "appli@test.com" and password "1234abcd"
  Then I should be on the home page
  When I click on Show for the "School" program
  Then I should see a link to "Apply"

Scenario: apply - happy path
  When I go to the user log in page
  And I log in as a user with email "appli@test.com" and password "1234abcd"
  Given I am on the details page for "School"
  When I follow "Apply"
  And I press "Create"
  Then I should be on the apps page
  And I should see an app for "School" with "I'm the best"

