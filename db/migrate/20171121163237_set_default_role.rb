class SetDefaultRole < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => 'applicant'
  end
end
