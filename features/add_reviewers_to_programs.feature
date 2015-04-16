Feature: Add Reviewers

  As an admin
  I want to associate reviewers and programs
  So reviewers can review their programs' applications

Background: users, programs, admin in database

    Given the following users exist:
    |       email          | password   |
    | applicant@gmail.com  | applicant  |
    | applicant2@gmail.com | applicant2 |

    Given the following programs exist:
    | title   | 
    | football|

     Given the following admins exist:
  	| email           | password |
  	| admin@admin.com | 1234abcd |

  	Scenario: Admin Program drop-down menu
  	When I go to the admin log in page
  	And I log in as an admin with email "admin@admin.com" and password "1234abcd"
  	When I go to the admin user page
  	And I follow 'Edit'
  	Then I should see a drop-down menu labeled "Program"
