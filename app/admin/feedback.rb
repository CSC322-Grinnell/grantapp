# Creates the tab for Reviewer Feedback.
ActiveAdmin.register Feedback do
    menu label: "Reviewer Feedback"
    permit_params :app, :comment, :score, :app_id, :user, :user_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
# Creates the table for all Feedback on the website, created in a strange way because feedback
#   relies on information not stored in its own database. This does cause issues with which data
#   one gets back. 
 index do
      selectable_column
      column "Program Title" do |feedback|
          feedback.app.program.title
          
      end
      column "Applicant Email" do |feedback|
          feedback.app.user.email
      end
      column :comment
      column :score
      column "Reviewer Email" do |feedback|
          feedback.user.email
      end
     
      
      actions
  end
  
  # Handles the edit feedback part, allows a lot of changes to be made that might not be necessary?
   form do |f| 
    f.inputs do
      #f.input :user, as: :select, collection: User.all.collect{|p| [p.first_name + " " + p.last_name, p.id]}
      f.input :app, as: :select, collection: App.all.collect{|p| [p.program_id, p.id]}
      f.input :comment
      f.input :score

    end
    f.actions
  end
  


end
