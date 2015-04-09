ActiveAdmin.register User do
 
  permit_params :first_name, :last_name, :email, :organization, :phone_number, :address, :role, :programs
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
form do |f|
    f.inputs do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :organization
        f.input :phone_number
        f.input :address
        f.input :role,  :as => :select, :collection => ["applicant", "reviewer"]
    end
    f.actions
end

end
