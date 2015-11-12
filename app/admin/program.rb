ActiveAdmin.register Program do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :short_description, :long_description, :picture, :deadline, :tags, :application_form, :rubric
  # permit_params :list, :of, :attributes, :on, :model
  # or
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
    index do
      selectable_column
      column :title
      column :short_description
      column :created_at
      column :deadline
      actions
  end
  
  form do |f| 
    f.inputs do
      f.input :title
      f.input :short_description
      f.input :long_description
      f.input :deadline
      f.input :picture
      f.input :tags
      f.input :application_form, :as => :file, :required => true
      f.input :rubric, :as => :file
    end
    f.actions
  end
end
