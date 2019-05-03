# Inside the admin portal, this is the tab for Admin Users.
ActiveAdmin.register AdminUser do
  permit_params :email, :role, :password, :password_confirmation, program_ids: []

# Creates the table seen with the following columns. Names them :(name) and uses
# :(name) as the variable to put in them. 
  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    attributes_table :email, :role, :current_sign_in_at, :sign_in_count, :created_at
  end

# Space under edit for an admin_user
  form do |f|
    # Following information that will be displayed with a text box to change it.
    f.inputs 'Admin Details' do
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    # Following information for a checkbox at the bottom of the form. 
    # Not working at the moment, but is suppose to allow an admin_user to be limited
    #   to specific programs in terms of ability to view and edit. 
    #   Only used for Secondary admin role. 
    f.inputs 'Program Privileges' do
        f.input :program_ids, :as => :check_boxes,
                :collection => Program.all, :label => 'Program'
      end
    end
    f.actions
  end
end
