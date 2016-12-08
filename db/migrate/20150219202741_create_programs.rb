class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :short_description
      t.string :long_description
      t.datetime :deadline
      t.string :tags

      t.timestamps null: false
    end
  end
end
