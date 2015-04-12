Feature: Application Privacy

  As a user
  I want to view only my own applications
  So I only see my applications

Background: user in database

    Given the following users exist:
    |       email    | password |
    | applicant@gmail.com | applicant |
    | applicant2@gmail.com | applicant2 |

    Given the following programs exist:
    | title |  short_description | long_description | deadline | picture | tags |
    | football| | | | | |

    Given the following apps exist:
    |       user    | program | text |
    | applicant@gmail.com | football | applicant app|
    | applicant2@gmail.com | football | applicant2  app|


Scenario: see apps
  When I go to the user log in page
  And I log in as a user with email "applicant@gmail.com " and password "applicant"
  And I go to the apps page
  Then I should see all applications with user "applicant@gmail.com"
  And I should not see any applications with user "applicant2@gmail.com"

Scenario: see no apps when not logged in
  When I go to the apps page
  Then I should see no applications

