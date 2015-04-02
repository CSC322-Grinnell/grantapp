Feature: Create programs

  As a admin
  When I log in
  So that I can create programs

Background: admin in database

  Given the following users exist:
  | email           | password | role           |
  | admin@admin.com | 1234abcd | Admin          |
  | fs@fs.com       | 1234abcd | Funding Source |
  | review@fs.com   | 1234abcd | Reviewer       |
  | app@app.com     | 1234abcd | Applicant      |

  Given the following programs exist:
  | title   |
  | Sample |

Scenario: admin can create programs
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X"
  Then a program with name "Program X" should exist


Scenario: admin can edit program
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X" 
  And I go to programs page
  And I click "Program X"
  And I click "Edit Program"
  And I fill form for "program_title" with "Program Super X"
  Then I click "Submit"
  Then a program with name "Program Super X" should exist

Scenario: delete program
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X"
  And I go to programs page
  And I click "Program X"
  And I click "Edit Program"
  And I click "Delete Program"
  Then a program with name "Program X" should not exist


Scenario: reviewer cannot create programs
  When I go to the user log in page
  And I log in as a user with email "review@fs.com" and password "1234abcd"
  And I go to create program page
  Then I should be on programs page

Scenario: applicant cannot create programs
  When I go to the user log in page
  And I log in as a user with email "app@app.com" and password "1234abcd"
  And I go to create program page
  Then I should be on programs page

Scenario: reviewer cannot edit programs
  When I go to the user log in page
  And I log in as a user with email "review@fs.com" and password "1234abcd"
  And I go to programs page
  And I click "Sample"
  Then I should not see a link with "Edit Program"

Scenario: applicants cannot edit programs
  When I go to the user log in page
  And I log in as a user with email "app@app.com" and password "1234abcd"
  And I go to programs page
  And I click "Sample"
  Then I should not see a link with "Edit Program"
