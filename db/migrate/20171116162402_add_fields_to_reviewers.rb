class AddFieldsToReviewers < ActiveRecord::Migration
  def change
    add_column :reviewers, :first_name, :string
    add_column :reviewers, :last_name, :string
    add_column :reviewers, :organization, :string
    add_column :reviewers, :phone_number, :string
    add_column :reviewers, :address, :string
    add_column :reviewers, :state, :string
    add_column :reviewers, :city, :string
    add_column :reviewers, :zip_code, :string
  end
end
