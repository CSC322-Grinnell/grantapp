ActiveAdmin.register AdminUser do
  permit_params :email, :role, :password, :password_confirmation, program_ids: []

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

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
      
    f.inputs 'Program Privileges' do
        f.input :program_ids, :as => :check_boxes,
                :collection => Program.all, :label => 'Program'
      end
    end
    f.actions
  end
end
