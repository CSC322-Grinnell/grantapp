class DropProgramsUsersTable < ActiveRecord::Migration
  def up
    drop_table :programs_users
  end

  def down
    raise ActiveRecord::IrreversibleMigrationP
  end
end
