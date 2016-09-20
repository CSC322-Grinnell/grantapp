This text file describes the views files in app/views

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