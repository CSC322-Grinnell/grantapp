class AddAdminUsersProgramsTable < ActiveRecord::Migration
  def up
    drop_table :admin_users_programs
      create_table :admin_users_programs do |t|
      t.integer :program_id
      t.integer :admin_user_id

      t.timestamps null: false
    end
  end
end
