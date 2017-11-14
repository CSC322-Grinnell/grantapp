# User table for Active Admin
ActiveAdmin.register User do
  actions :all, :except => [:new]
  permit_params :first_name, :last_name,
                :email, :organization, :phone_number, :address,
                :city, :state, :zip_code, program_ids: []
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
    attributes_table :first_name, :last_name, :address, :state, :city, :zip_code, :email, :organization, :phone_number, :current_sign_in_at, :sign_in_count, :created_at
  end
  # end
  index do
      selectable_column
      column :first_name
      column :last_name
      column :email
      column :state
      column :city
      column :zip_code
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
      f.input :state,  as: :select, collection: ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana','Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'] 
      f.input :city
      f.input :zip_code
      f.inputs 'Review Privileges' do
        f.input :program_ids, :as => :check_boxes,
                :collection => Program.all, :label => 'Program'
      end
    end
    f.actions
  end
end


