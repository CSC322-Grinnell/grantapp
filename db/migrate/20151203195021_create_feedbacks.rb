class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.integer :score
      t.timestamps null: false
    end
  end
end
