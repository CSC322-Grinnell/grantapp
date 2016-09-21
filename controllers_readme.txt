This text file describes the controller files in app/controllers

application_controller.rb: 
Inherits from ActionController::Base
Protects against a cross-site request forgery (CSRF) attack by denying request and throwing exception.
Redirects to homepage with exception message.

apps_controller.rb:
Inherits from InheritedResources::Base
load_and_authorize_resource (method automatically loads authorizes controller resources)
(private) define app params. require :app, permit :user_id, :program_id, :text, :user_app
(public) 
Define create, new, edit, update, and download methods.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
Create:
set app to App.new(app_params)
if app.save, redirect to app_path(@app)
else, redirect_to new_app_path(:program_id => params[:app][:program_id]) and alert the user that the method failed because of an invalid file type 
New:
set program to params[:program_id]
set user to current_user
Edit:
Set app to App.find(params[:id])
Set program to app.program_id
Set user to current_user
Update:
Set app to App.find(params[:id])
if app.update_attributes(app_params), redirect_to app_path(@app)
else redirect_to edit_app_path and alert the user that the method failed because of an invalid file type
Download:
redirect_to apps_path

See end of file for explanation of action controller parameters and require/permit methods.



feedbacks_controller.rb:
Inherits from InheritedResources::Base
load_and_authorize_resource (method automatically loads authorizes controller resources)
(private) define feedback params. require :feedback, permit: :user_id, :app_id, :comment, :score
(public) 
Define new method.
set app to params[:app_id]
set user to current_user.
Define edit method. 
set app to feedback.app.id
set user to feedback.userSee end of file for explanation of action controller parameters and require/permit methods.



homepage_controller.rb:
Inherits from ApplicationController
End.



programs_controller.rb:
Inherits from InheritedResources::Base
load_and_authorize_resource (method automatically loads authorizes controller resources)
Defines program parameters.
Require: :program
Permit: :title, :short_description, :long_description, :deadline, :picture, :tags, :application_form, :rubric
See end of file for explanation of action controller parameters and require/permit methods.



users_controller.rb:
Inherits from InheritedResources::Base
Defines user parameters.
Require: :user
Permit: :first_name, :last_name, :email, :organization, :phone_number, :address, :role
See end of file for explanation of action controller parameters and require/permit methods.



==========================================================================================================
Action controller parameters
Allows you to choose which attributes should be whitelisted for mass updating.
Helps prevent exposing attributes that shouldn't be exposed. 
Uses two methods: require and permit.
Require marks the parameters as required.
Permit sets the parameter as permitted and limits which attributes should be allowed for mass updating.
Further explanation: http://api.rubyonrails.org/classes/ActionController/Parameters.html#method-i-require

