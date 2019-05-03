# Handles the tab for Applications inside the admin portal. 
ActiveAdmin.register App do
  menu label: "Applications"
  # Think it works by saying do everything for the table except be able to create.
  actions :all, :except => [:new]
  permit_params :user, :program
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
end
