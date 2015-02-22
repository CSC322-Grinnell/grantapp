class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :user, index: true
      t.references :program, index: true

      t.timestamps null: false
    end
    add_foreign_key :applications, :users
    add_foreign_key :applications, :programs
  end
end
