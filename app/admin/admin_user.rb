ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role

  if can? :manage, @admin_users
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
      attributes_table :email, :current_sign_in_at, :sign_in_count, :created_at
    end
  
    form do |f|
      f.inputs 'Admin Details' do
        f.input :email
        #Commented out so you dont have to change password everytime you change the role. 
        f.input :password
        f.input :password_confirmation
        f.input :role, as: :select, collection: ['admin_users', 'secondary_admin_users']
      end
      f.actions
    end
  end
end
