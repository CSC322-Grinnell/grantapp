# User table for Active Admin
ActiveAdmin.register User do
  actions :all, :except => [:new]
  permit_params :first_name, :last_name,
                :email, :organization, :phone_number, :address,
                :role, program_ids: []
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
  show do
    attributes_table :first_name, :last_name, :address, :email, :organization, :phone_number, :role, :current_sign_in_at, :sign_in_count, :created_at
  end
  # end
  index do
      selectable_column
      column :first_name
      column :last_name
      column :email
      column :role
      actions
  end
  form do |f| 
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :organization
      f.input :phone_number
      f.input :address
      f.input :role,  as: :select, collection: ['applicant', 'reviewer']
      f.inputs 'Review Privileges' do
        f.input :program_ids, :as => :check_boxes,
                :collection => Program.all, :label => 'Program'
      end
    end
    f.actions
  end
end


