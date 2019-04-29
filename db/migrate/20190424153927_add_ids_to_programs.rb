class AddIdsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :program_id, :integer
    add_column :programs, :user_id, :integer
  end
end
