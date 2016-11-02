This text file describes the model files in app/models


ability.rb:
This file determines what permissions a user has. Presumably it’s called each time a page is loaded to make 
sure the user sees only what they have permissions to see, so we’ll need to find where it’s being called from. 
Looks like if a user isn’t logged in, they can just “read” (see) the general “program” 
(basically everything on the site?) but can’t “manage” or “read” grant applications or feedback. 
Applicants and reviewers have more permissions, and those consist of the permissions one would expect for 
each role (viewing the application, managing either the application or the feedback page).
We will also need to figure out the CanCan::Ability bit -- where it’s from.

gives different managing and reading roles depending on type of user
nil or else -> can read program
applicant -> can manage App and read Program 
reviewer-> can manage Feedback and read App and Program 

admin_user.rb: 
We need to figure out what devise modules are, because it seems that the admin user has several of these 
attributed to them. Also need to find the superclass ActiveRecord::Base.
Update: ActiveRecord::Base seems to denote records that are saved into the back-end database -- referenced
in one of the SaaS readings.

uses devise gem and modules: database_authenticatable (ensures that a user enters a correct password, and it encrypts the said password, before saving it), recoverable (for handling forgotten passwords safely), rememberable (for remembering a user based on cookies), trackable (stores login information for admins to track unusual activity), validatable (ensures the given email/name and password conform to a specific format)
https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication

app.rb: 
App class inherits from ActiveRecord
Active record associations with user, program, and feedback: belongs to user, belongs to program, has many feedback
Has attached file (application) and validates that it is of a certain format (pdf, vnd.ms-excel, .sheet, msword, .document)
When application is destroyed, delete dependent feedback (for each feedback where self.id == app_id)

feedback.rb:
Designates the relationship between the feedback entry and users as well as applications (belongs_to relationship). 
Feedback is also a child of ActiveRecord::Base.
Active record associations with user and app (belongs to user and app) 

program.rb:
Active record associations with app, user (has many apps, has many and belongs to many users) 
Has attached files (application and rubric) and validates that they are of certain formats (app: plain text, pdf, msword, msexcel. rubric: plain text, pdf, msword, msexcel)
Paperclip::Attachment -- manages files for a given attachment, saves/deletes when model saves/deletes, processes file upon assignment 
http://www.rubydoc.info/github/thoughtbot/paperclip/Paperclip/Attachment

user.rb: 
Active record associations with app, programs (has many apps, has and belongs to many programs)
Accepts nested attributes for programs
uses devise gem and modules: 
database_authenticatable (ensures that a user enters a correct password, and it encrypts the said password, before saving it), 
registerable (allows users to register and subsequently change login info),
recoverable (for handling forgotten passwords safely), 
rememberable (for remembering a user based on cookies), 
trackable (stores login information for admins to track unusual activity), 
validatable (ensures the given email/name and password conform to a specific format)
https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication