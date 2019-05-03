class AddProgramsUsersTable < ActiveRecord::Migration
  def up
    drop_table :programs_users
    create_table :programs_users do |t|
      t.integer :program_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
