This text file describes the views files in app/views

=========================APPS FOLDER=========================
New.html.erb: Renders the header of a newly started application page, then calls the rendering of the general 
_form.html.erb that presumably is the omni-applicable subpage used for all application creating, editing, 
and perhaps destroying.

Edit.html.erb: Exact same as new.html.erb except replaces the header text with ‘edit’ related terminology 
instead of ‘creating new’ terminology.

_Form.html.erb: First segment within the if-statement is html encoding of a conditional error message 
that appears if the app has any errors on that page. The form that is being filled out on this page has 
two fields, program_id and user_id, which are hidden and the page automatically fills out according to 
the current user. Actual application submission div on page comes next, with a required field of user_app 
which presumably is a pdf or other attachment to be uploaded. Finally there’s a submit button that is disabled 
when clicked and changes its text to “Submitting...”, and a cancel button.

Show.html.erb: This page shows existing applications once selected from a list of applications available on a 
separate page. It shows title, date submitted, and has a link for users to click and download the attached 
application in some form. There are also three buttons along the bottom (Back, Edit, and Destroy) that presumably 
take the user back to the previous page, or the edit and _form pages mentioned above.

Index.html.erb: This page shows the list of applications available on the website in a “striped” data table, 
with different functionality available depending on if the user is an applicant or a reviewer. Applicants 
are allowed to show, edit or destroy applications in this table (unclear on if they’re allowed to 
edit/destroy applications they themselves haven’t made in the first place, which would be BAD), and 
reviewers have access to the application owner’s email and can give feedback by clicking a button and 
navigating off of this page.
================================================================================

=========================DEVISE FOLDER==========================================
Confirmations: Resends confirmation message, though I don't understand the content
of the html

Mailer: Contains the three possible emails that are sent to users regarding password
authentication -- Initial email confirmation, reset password instructions, and unlocking
account instructions after their account has been locked due to too many failed login
attempts

Passwords: Contains forms for requesting a link to reset a forgotten password (new.html.erb)
and for actually replacing an old forgotten password with a new one (edit.html.erb)

Registrations: Looks like edit.html.erb shows the current state of a user's profile
(confirmed/unconfirmed, ability to change password) and new.html.erb is used to
sign up for a new account?

Sessions: This html is for the login page, which we can see from rails server. Probably
should add a "forgotten password?" link to this page.

Shared: Has the html encoding for a bunch of links, such as Login, Signup, Forgot password?,
didn't receive (confirmation/unlock) instructions?. Likely referenced from other html files,
hence being stored in a shared folder that they all share.

Unlocks: Page used to send an unlock instruction email to the user.
================================================================================

================================= HOME FOLDER ==================================
The Home Page

/homepage/index.html.erb
	It is a static page with very little inline ruby code
	It can only display the sign in button only if the user is not signed in
No calls for external files


============================== ADMIN FOLDER ====================================

/admin_users/confirmations/new.html.erb
	We have the new admin user file which is mostly html embedded in ruby
It generates a form to create the user
It has a link to the links file in the links directory

/admin_users/shared/_links.html.erb
	Contains the links to login, Sign Up and ***password retrieval***
Entirely ruby code with a few html tags
Displays the login link if the user is currently not logged in
There are also links for registration, confirmation instructions, unlock instructions and sign in options probably to sign in with a social network

/admin_users/passwords/edit.html.erb
	A mixture of both ruby and html
Generates a form with two text boxes for password and password confirmation with no autocomplete
A submit button to submit the edited password
	
/admin_users/passwords/new.html.erb
	A mixture of both ruby and html
Used for password retrieval for the admin
Generates a form with the email input text field
The submit button sends password retrieval information

/admin_users/registrations/new.html.erb
	A mixture
	Used to register new admin users
	There is a signup submit button

/admin_users/registrations/edit.html.erb
	A mixture
	Provides the form to update admin user information
	Has an update form button to submit the changes to the server
	Also provides a button to cancel the account


/admin_users/sessions/new.html.erb
	Mixture
	Contains a login form with email and password text box
	Also contains a “keep me signed in” checkbox
	Also renders the links in “/admin_users/shared/_links.html.erb”
	
/admin_users/unlocks/new.html.erb
	Mixture
	Resends unlock instructions
	Has a file with an email input text box
	Also renders the links in “/admin_users/shared/_links.html.erb”

/admin_users/mailer/confirmation_instructions.html.erb
Mixture
	Link to confirm email

/admin_users/mailer/reset_password_instructions.html.erb	
	Mixture
	Contains reset password instructions
	Link to change the password

/admin_users/mailer/unlock_instructions.html.erb
	Mixture
	Instructions to unlock the user’s account which would have been locked due to massive unsuccessful login attempts


=========================== PROGRAMS FOLDER ====================================

This is for the programs folder
	
/programs/_form.html.rb
	It’s a mixture of both html and ruby
	It’s undocumented and confusing and contains a form

/programs/edit.html.ruby
	It is a mixture of html and ruby
Has a header
	Ir renders a partial form

/programs/index.html.rb
	Mixture
	Has an html table to show probably the grant applications
It shows the apply button if the user is logged in 

/programs/new.html.erb
	There is a header that probably shows the title
	It renders a partial form
	It doesn’t make sense at all

/programs/show.html.erb
	Contains a table
	Mixture of both html and ruby
	It shows the apply button if the current user is an applicant
	Contains a link to view forms
	If the user is not logged in, it gives a link that tells the user to log in

/users/confirmations/new.html.erb
	Contains the resend confirmation instructions prompt
	Users can view this page if they didn’t receive their confirmation instructions
	Contains a form with their email
	
================================================================================

================================/users/passwords================================
Edit: Change password page, has a hidden auth token to allow resetting. Has labels
and fields for new password and password confirmation, and then has an action
button to submit the password change

New: "Forgot your password?" page. Has an email field and a submit button which user
can click to send password reset authentication token (which is hidden) to.
================================================================================

================================/users/registrations============================
asdf.new: Sign up page for new users (email, password, password confirmation).

edit.html: Editing user profile settings page. Can change password while logged in,
can update email address, but both of these operations require the current user's
password for verification/security. Final option is to cancel account, which calls
"delete" method.
================================================================================

================================/users/shared===================================
_links.html.erb: Makes sure all devise funcality is being used or prompts its 
use (log in to session, register, recover password, confirm acct, unlock acct, 
omniauthable log in)


================================================================================

=============================/users/* (no subfolder)============================

_form.html.erb: 
Form builder for user form (uses form-horizontal, meaning prompt and user input
appear on same line)
Check for errors and throw messages accordingly. 
Displays labels and take input for:
first_name, last_name, email, organization, phone_number, address, role, 
encrypted_password, reset_password_token, remember_created_at, 
remember_sign_in_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, 
last_sign_in_ip. 
Ability to submit (button?)

edit.html.erb:
Allows you to edit user info. 
Renders _form.html.erb

index.html.erb:
Shows a table of all users (Fields listed in form), links to edit and destroy 
users and make a new user. 

index.json.jbuilder:
Builds the index page in json array. 
Extracts the following fields: user, :id, :first_name, :last_name, :email, 
:organization, :phone_number, :address, :role
Creates links to edit, destroy, new user. 

new.html.erb:
Allows you to made a new user.
Renders _form.html.erb

show.html.erb:
Show information for one user (Fields listed in form), links to edit and destroy
user and make a new user. 

show.json.jsbuilder:
Builds the show.html.erb page in json
Extracts the following fields: @user, :id, :first_name, :last_name, :email, 
:organization, :phone_number, :address, :role, :created_at, :updated_at


================================================================================


