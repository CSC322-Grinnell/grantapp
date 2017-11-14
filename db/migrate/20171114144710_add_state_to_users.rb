class AddStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    remove_column :users, :role, :string
  end
end
